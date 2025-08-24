addi x1, x0, 0x10 # x1 = 0x10
add x2, x2, x1 # x2 = 0x12
sw x2, 0(x1) # mem[0x10] = 0x12
beq x2,x2,Label # after_instr = 0x0000A183
nop # not touched
Label:
nop 
lw x3, 0(x1) # x3 = 0x12
jal x1,func # x1 = 0x20, after_instr = 0x00008067
nop
nop
jalr x4, 0(x0) # x4 = 0x2c, after_instr = 0x01000093
func:
jalr x0, 0(x1)


# easy verion

# 0x00000000		0x01000093		addi x1 x0 16 // x1 = 0x10
# 0x00000004		0x00110133		add x2 x2 x1  // x2 = 0x12
# 0x00000008		0x0020A023		sw x2 0(x1)     mem[0x10]=0x12 mem[0x11..0x13]=0
# 0x0000000C		0x00210463		beq x2 x2 8     after_instr=0x00000013
# 0x00000010		0x00000013		addi x0 x0 0    
# 0x00000014		0x00000013		addi x0 x0 0    
# 0x00000018		0x0000A183		lw x3 0(x1)     x3 = 0x12 
# 0x0000001C		0x010000EF		jal x1 16       
# 0x00000020		0x00000013		addi x0 x0 0    
# 0x00000024		0x00000013		addi x0 x0 0    
# 0x00000028		0x00000267		jalr x4 x0 0
# 0x0000002C		0x00008067		jalr x0 x1 0