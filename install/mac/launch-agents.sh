#!/bin/bash
set -e

# Original values
# F1  0x0007003a,0x00ff0005
# F2  0x0007003b,0x00ff0004
# F3  0x0007003c,0xff010010
# F4  0x0007003d,0x000c0221
# F5  0x0007003e,0x000c00cf
# F6  0x0007003f,0x0001009b
# F7  0x00070040,0x000c00b4
# F8  0x00070041,0x000c00cd
# F9  0x00070042,0x000c00b3
# F10 0x00070043,0x000c00e2
# F11 0x00070044,0x000c00ea
# F12 0x00070045,0x000c00e9

PLIST="$HOME/Library/LaunchAgents/com.local.fkey-remap.plist"

# F3->F13, F4->F14, F5->F15, F6->F16  (Src = columna 2, padded a 64-bit)
MAPPING='{"UserKeyMapping":[
  {"HIDKeyboardModifierMappingSrc":0xFF0100000010,"HIDKeyboardModifierMappingDst":0x700000068},
  {"HIDKeyboardModifierMappingSrc":0xC00000221,"HIDKeyboardModifierMappingDst":0x700000069},
  {"HIDKeyboardModifierMappingSrc":0xC000000CF,"HIDKeyboardModifierMappingDst":0x70000006A},
  {"HIDKeyboardModifierMappingSrc":0x10000009B,"HIDKeyboardModifierMappingDst":0x70000006B}
]}'

cat > "$PLIST" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.local.fkey-remap</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/hidutil</string>
        <string>property</string>
        <string>--set</string>
        <string>$(echo "$MAPPING" | tr -d '\n ')</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
EOF

launchctl unload "$PLIST" 2>/dev/null || true
launchctl load "$PLIST"
hidutil property --set "$(echo "$MAPPING" | tr -d '\n ')"

echo "Hecho. F3->F13, F4->F14, F5->F15, F6->F16"
