#!/usr/bin/env node

const { basename } = require('path');
const { promisify } = require('util');
const exec = promisify(require('child_process').exec);

const NO = '--';
const NO_DATE = `${NO}${NO}:${NO}:${NO} ${NO}:${NO}:${NO}`;
const EXIFTOOL = 'exiftool -overwrite_original';

const path = process.argv[2];
const years = new Map();
const yearMonths = new Map();
const failed = [];
const dryRun = false;

const formats = [
  // 'img-00000000',
  regexFormat(
    /^img.((?:19|20)\d{2})(\D?)(\d{2})\2(\d{2})(?:_(\d{2})(\D?)(\d{2})(?:\6(\d{2})(?:\D(\d{3}))?)?)?(?:$|\D)/,
    x => [x[1], x[3], x[4], x[5], x[7], x[8], x[9]]
  ),

  // '0000-00-00 00:00(:00)?',
  regexFormat(
    /(?:^|\D)((?:19|20)\d{2})(\D?)(\d{2})\2(\d{2})(?:\D{0,3}(\d{2})(\D?)(\d{2})(?:\6(\d{2})(?:\D(\d{3}))?)?)?(?:$|\D)/,
    x => [x[1], x[3], x[4], x[5], x[7], x[8]]
  ),

  // '0000-00-00',
  regexFormat(/(?:^|\D)((?:19|20)\d{2})(\D)(\d{1,2})\2(\d{1,2})(?:$|\D)/, x => [
    x[1],
    x[3],
    x[4],
  ]),

  // '00-00-0000',
  regexFormat(/(?:^|\D)(\d{1,2})(\D)(\d{1,2})\2((?:19|20)\d{2})(?:$|\D)/, x => [
    x[4],
    x[3],
    x[1],
  ]),

  // '000-0000',
  regexFormat(
    /^(?:^|\D)\d{3}\D{1,3}((?:19|20)\d{2})(?:(\D)(\d{1,2})\2(\d{1,2}))?(?:$|\D)/,
    x => [x[1], x[3], x[4]]
  ),

  // '0000-000',
  regexFormat(/^(?:^|\D)((?:19|20)\d{2})\D{1,3}(\d{3})(?:$|\D)/, x => [x[1]]),

  // '0000',
  regexFormat(/(?<!dsc)(?:^|\D)((?:19|20)\d{2})(?:$|\D)/, x => [x[1]]),
];

main().then(
  () => console.log('COMPLETED'),
  err => {
    console.error('ERROR');
    console.error(err);
  }
);

async function main() {
  const files = await getFiles(path);

  for (const path of files) {
    const filename = basename(path);
    const clean = cleanFilename(filename);
    const name = parseFilename(clean, path);
    const exif = await getExifDate(path);
    const replace = shouldReplace(name, exif);

    const original = exif ? exif.fmt : NO_DATE;
    const target = name ? name.fmt : NO_DATE;
    const flag = replace ? `\x1b[93m=>\x1b[0m` : `\x1b[91m||\x1b[0m`;
    const logName = path
      .split('/')
      .slice(-2)
      .join('/');

    console.log(
      `\x1b[36;1m[${original}]\x1b[0m ${flag} \x1b[32;1m[${target}]\x1b[0m ${logName}`
    );

    if (!dryRun && replace) await setExifDate(path, name.fmt);
  }

  if (failed.length) {
    console.warn('Failed files:');

    for (const file of failed) {
      console.warn(`- ${file}`);
    }
  }
}

function shouldReplace(name, exif) {
  if (!name) return false;
  if (!exif) return true;
  if (name.getFullYear() != exif.getFullYear()) return true;
  if (
    name.fmt === exif.fmt ||
    safeFmtPreview(name.fmt) === safeFmtPreview(exif.fmt)
  )
    return false;

  const digitsInName = name.fmt.match(/\d/g).length;
  const digitsInExif = exif.fmt.match(/\d/g).length;

  if (digitsInName != digitsInExif && digitsInName < 12)
    return digitsInName > digitsInExif;

  const diff = name - exif;
  const tenDays = 1000 * 60 * 60 * 24 * 10;
  return diff < tenDays;
}

async function getExifDate(path) {
  const output = await run(`exiftool -DateTimeOriginal '${path}'`);
  const [_, fmt] = output.split(/\s+:\s+/);
  if (!fmt) return null;

  const [clean] = fmt.split('+');
  const date = parseDate(clean);
  date.fmt = clean.trim();
  return date;
}

async function setExifDate(path, date) {
  // REPLACE_NO
  try {
    await runLogginErrors(`${EXIFTOOL} -AllDates='${date}' '${path}'`);
  } catch (err) {}

  try {
    await runLogginErrors(
      `${EXIFTOOL} -DateTimeOriginal='${safeFmt(date)}' '${path}'`
    );
    // await runLogginErrors(
    //   `${EXIFTOOL} -CreateDate='${safeFmt(date)}' '${path}'`
    // );
  } catch (err) {
    failed.push(path);
    console.log('- Continuing...');
    console.error(err);
    return Promise.resolve(null);
  }
}

async function runLogginErrors(command) {
  try {
    const a = await run(command);
    return a;
  } catch (err) {
    console.error(`ERROR: Running command "${command}"`);
    console.error(err);
    throw err;
  }
}

function safeFmt(fmt) {
  return fmt.replace(`${NO} ${NO}`, '00 00').replace(new RegExp(NO, 'g'), '00');
}

function safeFmtPreview(fmt) {
  const [date, time] = fmt.split(' ');
  const no = new RegExp(NO, 'g');
  return `${date.replace(no, '01')} ${time.replace(no, '00')}`;
  // return fmt.replace(`${NO} ${NO}`, '01 00').replace(new RegExp(NO, 'g'), '01');
}

function parseFilename(filename, path) {
  const parser = formats.find(x => x.test(filename));
  if (parser) return parser.run(filename);

  const folder = path
    .split('/')
    .slice(-2)
    .shift();

  const monthMatch = folder.match(/^(\d{4})\D(\d{2})(?:\D|$)/);
  if (monthMatch) {
    const [_, year, month] = monthMatch;
    const date = new Date(int(year), int(month) - 1, 1, 0, 0, 0);
    date.fmt = `${year}:${month}:${NO} ${NO}:${NO}:${NO}`;
    return patchMonthDate(date);
  }

  const yearMatch = folder.match(/^(\d{4})(?:\D|$)/);
  if (yearMatch) {
    const year = yearMatch[1];
    const date = new Date(int(year), 0, 1, 0, 0, 0);
    date.fmt = `${year}:${NO}:${NO} ${NO}:${NO}:${NO}`;
    return patchYearDate(date);
  }

  return null;
}

async function getFiles(path) {
  const list = await run(`find '${path}' -type f`);
  return (
    list
      .split('\n')
      .filter(x => /\.jpe?g/.test(x))
      .filter(x => !/estadio_marathon_sevilla_/i.test(x))
      // .filter(x => /1994_0001/.test(x))
      .sort(naturalCompare)
  );
}

async function run(command) {
  const { stdout, stderr } = await exec(command, { maxBuffer: 1024 * 1024 });

  if (stderr) {
    console.warn(`STDERR: Running command "${command}"`);
    console.warn(stderr);
  }

  return stdout;
}

function patchYearDate(date) {
  const year = date.getFullYear();

  if (years.has(year)) {
    const { fmt } = date;
    date = addSeconds(years.get(year), 1);
    patchFmtSeconds(date, fmt);
  }

  years.set(year, date);
  return date;
}

function patchMonthDate(date) {
  const year = date.getFullYear();
  const month = date.getMonth() + 1;
  const key = `${year}-${month}`;

  if (yearMonths.has(key)) {
    const { fmt } = date;
    date = addSeconds(yearMonths.get(key), 1);
    patchFmtSeconds(date, fmt);
  }

  yearMonths.set(key, date);
  return date;
}

function patchFmtSeconds(date, fmt) {
  const mins = date.getMinutes();
  const secs = date.getSeconds();
  const pattern = `:(\\d{2}|${NO})`;

  if (mins === 0) {
    // REPLACE_NO
    date.fmt = fmt.replace(new RegExp(`${pattern}$`), `:${pad(secs)}`);
  } else {
    // REPLACE_NO
    date.fmt = fmt.replace(
      new RegExp(`${pattern}${pattern}$`),
      `:${pad(mins)}:${pad(secs)}`
    );
  }
}

function addSeconds(date, modifier) {
  return new Date(
    date.getFullYear(),
    date.getMonth(),
    date.getDate(),
    date.getHours(),
    date.getMinutes(),
    date.getSeconds() + modifier
  );
}

function regexFormat(regex, parser) {
  return {
    // name,
    test: x => regex.test(x),
    run(file) {
      const match = file.match(regex);
      const str = parser(match).filter(Boolean);
      const tokens = str.map(x => int(x));
      const x = Array(6)
        .fill(null)
        .map((_, i) => str[i] || NO);

      const fmt = `${x[0]}:${x[1]}:${x[2]} ${x[3]}:${x[4]}:${x[5]}`;

      if (tokens.length !== 1) {
        tokens[1]--;
        return setFmt(new Date(...tokens), fmt);
      }

      const year = setFmt(new Date(tokens[0], 0, 1), fmt);
      return patchYearDate(year);
    },
  };
}

function naturalCompare(a, b) {
  const ax = [];
  const bx = [];

  a.replace(/(\d+)|(\D+)/g, (_, $1, $2) => {
    ax.push([$1 || Infinity, $2 || '']);
  });

  b.replace(/(\d+)|(\D+)/g, (_, $1, $2) => {
    bx.push([$1 || Infinity, $2 || '']);
  });

  while (ax.length && bx.length) {
    var an = ax.shift();
    var bn = bx.shift();
    var nn = an[0] - bn[0] || an[1].localeCompare(bn[1]);
    if (nn) return nn;
  }

  return ax.length - bx.length;
}

function cleanFilename(filename) {
  return filename
    .toLowerCase()
    .replace(/\s+/g, ' ')
    .replace(/\s*\.jpe?g$/g, '')
    .replace(/enero/g, '01')
    .replace(/febrero/g, '02')
    .replace(/marzo/g, '03')
    .replace(/abril/g, '04')
    .replace(/mayo/g, '05')
    .replace(/junio/g, '06')
    .replace(/julio/g, '07')
    .replace(/agosto/g, '08')
    .replace(/setiembre/g, '09')
    .replace(/octubre/g, '10')
    .replace(/\bnov(iembre)?\b/g, '11')
    .replace(/enero/g, '12');
}

function formatDate(date) {
  if (!date) return NO_DATE;
  const year = date.getFullYear();
  const month = pad(date.getMonth() + 1);
  const day = pad(date.getDate());
  const hours = pad(date.getHours());
  const mins = pad(date.getMinutes());
  const secs = pad(date.getSeconds());
  return `${year}:${month}:${day} ${hours}:${mins}:${secs}`;
}

function parseDate(date) {
  const year = int(date.substr(0, 4));
  const month = int(date.substr(5, 2)) || 1;
  const day = int(date.substr(8, 2), 1) || 1;
  const hours = int(date.substr(11, 2), 0);
  const mins = int(date.substr(14, 2), 0);
  const secs = int(date.substr(17, 2), 0);
  return new Date(year, month - 1, day, hours, mins, secs);
}

function setFmt(date, fmt) {
  date.fmt = fmt;
  return date;
}

function pad(num) {
  const str = num.toString();
  return str.length === 1 ? `0${str}` : str;
}

function int(str, def = null) {
  return str ? parseInt(str, 10) : def;
}
