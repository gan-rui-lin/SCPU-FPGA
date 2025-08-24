add x1 x0 x0
addi x1 x1 1
add x2 x0 x0
addi x2 x2 2
add x3 x0 x0
addi x3 x3 3
sll x4 x1 x2
srl x5 x7 x2
sra x6 x7 x2
addi x7 x0 -2
srl x8 x7 x1
sra x9 x7 x1
addi x10 x0 -4
beq x1 x0 test1
beq x1 x1 test1
addi x11 x0 7
test1:addi x12 x0 8
bne x1 x1 test2
bne x0 x1 test2
addi x11 x0 7
test2:addi x13 x0 9
blt x2 x1 test3
blt x7 x10 test3
blt x1 x10 test3
blt x1 x2 test3
addi x11 x0 7
test3:addi x14 x0 10
blt x10 x7 test31
addi x11 x0 7
test31:addi x15 x0 11
blt x10 x1 test32
addi x11 x0 7
test32:addi x16 x0 12
bge x1 x2 test4
bge x10 x1 test4
bge x10 x7 test4
bge x2 x1 test4
addi x11 x0 7
test4:addi x17 x0 13
bge x7 x10 test41
addi x11 x0 7
test41:addi x18 x0 14
bge x1 x10 test42
addi x11 x0 7
test42:addi x19 x0 15
bgeu x1 x7 test5
bgeu x1 x2 test5
bgeu x7 x1 test5
addi x11 x0 7
test5:addi x20 x0 16
bltu x7 x1 test6
bltu x1 x7 test6
addi x11 x0 7
test6:addi x21 x0 17
jal x22 test7
addi x23 x0 18
test7:addi x24 x0 19
jalr x0 0(x22)


0x00000000		0x000000B3		add x1 x0 x0
0x00000004		0x00108093		addi x1 x1 1    x1 = 1
0x00000008		0x00000133		add x2 x0 x0
0x0000000C		0x00210113		addi x2 x2 2    x2 = 2
0x00000010		0x000001B3		add x3 x0 x0
0x00000014		0x00318193		addi x3 x3 3    x3 = 3
0x00000018		0x00209233		sll x4 x1 x2    x4 = 1 << 2 = 4
0x0000001C		0x0023D2B3		srl x5 x7 x2    x5 = 7 >> 2 = 1
0x00000020		0x4023D333		sra x6 x7 x2    x6 = 7 >>> 2 = 1
0x00000024		0xFFE00393		addi x7 x0 -2   x7 = -2
0x00000028		0x0013D433		srl x8 x7 x1    x8 = -2 >>> 1 = ?
0x0000002C		0x4013D4B3		sra x9 x7 x1    x9 = -2 >> 1 = -1
0x00000030		0xFFC00513		addi x10 x0 -4  x10 = -4
0x00000034		0x00008663		beq x1 x0 12    false
0x00000038		0x00108463		beq x1 x1 8     next_instr = 0x00800613
0x0000003C		0x00700593		addi x11 x0 7   
0x00000040		0x00800613		addi x12 x0 8   x12 = 8
0x00000044		0x00109663		bne x1 x1 12    false
0x00000048		0x00101463		bne x0 x1 8     next_instr = 0x00900693  
0x0000004C		0x00700593		addi x11 x0 7
0x00000050		0x00900693		addi x13 x0 9   x13 = 9
0x00000054		0x00114A63		blt x2 x1 20    false
0x00000058		0x00A3C863		blt x7 x10 16   false
0x0000005C		0x00A0C663		blt x1 x10 12   false
0x00000060		0x0020C463		blt x1 x2 8     next_instr = 0x00A00713
0x00000064		0x00700593		addi x11 x0 7
0x00000068		0x00A00713		addi x14 x0 10  x14 = 10
0x0000006C		0x00754463		blt x10 x7 8    next_instr = 0x00B00793
0x00000070		0x00700593		addi x11 x0 7   
0x00000074		0x00B00793		addi x15 x0 11  x15 = 11
0x00000078		0x00154463		blt x10 x1 8    next_instr = 0x00C00813
0x0000007C		0x00700593		addi x11 x0 7   
0x00000080		0x00C00813		addi x16 x0 12  x16 = 12
0x00000084		0x0020DA63		bge x1 x2 20    false
0x00000088		0x00155863		bge x10 x1 16   false
0x0000008C		0x00755663		bge x10 x7 12   false
0x00000090		0x00115463		bge x2 x1 8     next_instr = 0x00D00893
0x00000094		0x00700593		addi x11 x0 7
0x00000098		0x00D00893		addi x17 x0 13  x17 = 13
0x0000009C		0x00A3D463		bge x7 x10 8    next_instr = 0x00E00913
0x000000A0		0x00700593		addi x11 x0 7
0x000000A4		0x00E00913		addi x18 x0 14  x18 = 14
0x000000A8		0x00A0D463		bge x1 x10 8    next_instr = 0x00F00993
0x000000AC		0x00700593		addi x11 x0 7
0x000000B0		0x00F00993		addi x19 x0 15  x19 = 15
0x000000B4		0x0070F863		bgeu x1 x7 16   false
0x000000B8		0x0020F663		bgeu x1 x2 12   false
0x000000BC		0x0013F463		bgeu x7 x1 8    next_instr = 0x01000A13
0x000000C0		0x00700593		addi x11 x0 7
0x000000C4		0x01000A13		addi x20 x0 16  x20 = 16
0x000000C8		0x0013E663		bltu x7 x1 12   false
0x000000CC		0x0070E463		bltu x1 x7 8    next_instr = 0x01100A93
0x000000D0		0x00700593		addi x11 x0 7
0x000000D4		0x01100A93		addi x21 x0 17  x21 = 17
0x000000D8		0x00800B6F		jal x22 8       x22 = 0x000000DC, next_instr = 0x01300C13
0x000000DC		0x01200B93		addi x23 x0 18  x23 = 18
0x000000E0		0x01300C13		addi x24 x0 19  x24 = 19
0x000000E4		0x000B0067		jalr x0 x22 0   next_instr = 0x01200B93
