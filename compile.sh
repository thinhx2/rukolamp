MCU=attiny13a

# avr-c++ -mmcu=$MCU -Wall -g -gdwarf-2 -DF_CPU=16000000UL -O1 -ffreestanding -fno-tree-scev-cprop -mcall-prologues -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -fno-jump-tables -fdata-sections -ffunction-sections -fwhole-program -Wl,--gc-sections -Wl,-u,vfprintf -lprintf_flt -lm -c medut.cpp -o medut.elf
# avr-c++ -mmcu=$MCU -Wall -g -gdwarf-2 -DF_CPU=16000000UL -O1 -ffreestanding -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -lm -c medut.cpp -o medut.elf

CFLAGS="-Wall -W"
#CLAGS+=" -pedantic"
CFLAGS+=" -g3 -gdwarf-2 -gstrict-dwarf"
CFLAGS+=" -DF_CPU=4800000UL -Os"
CFLAGS+=" -ffreestanding"
#CFLAGS+=" -mshort-calls"
#CFLAGS+=" -msize"
CFLAGS+=" -fno-tree-scev-cprop"
#CFLAGS+=" -mcall-prologues"
CFLAGS+=" -fno-jump-tables"
CFLAGS+=" -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums"
CFLAGS+=" -fno-split-wide-types"
CFLAGS+=" -fwhole-program"
CFLAGS+=" -Wl,--gc-sections"
CFLAGS+=" -ffunction-sections"
CFLAGS+=" -fdata-sections"
CFLAGS+=" -Wl,--relax"
CFLAGS+=" -Wa,-a,-ad"
CFLAGS+=" -nostartfiles"

avr-c++ -mmcu=$MCU $CFLAGS gcrt1.S rukolamp.c -o rukolamp.elf  > rukolamp.lst

avr-objcopy -O ihex -R .eeprom -R .fuse -R .lock -R .signature rukolamp.elf rukolamp.hex
avr-size --mcu=$MCU --format=avr rukolamp.elf
avr-objdump -h -S rukolamp.elf > rukolamp.lss
