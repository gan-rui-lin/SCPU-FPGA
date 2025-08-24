# 项目说明

这是一个使用 `verilog` 实现的 `riscv` 的基础指令集的子集的单周期的 CPU 项目，并通过了下板实验。

- 请自行修改 `xdc` 文件以适应实际的硬件环境

- 默认使用 `testall.coe`。（包含 `beq`, `jal`, `jalr`, `bne`, `sra`... 等 `RV32i` 指令集的代表性子集）
- 关于测试代码的细节、期望现象，都在同目录下的 `testall.s`。
- 调试时确保 `sw_i[0]=1`。

```verilog
wire fast_disp = sw_i[15]; // 为 1, 快速展示
wire pc_pause = sw_i[0];   // 为 1， 指令暂停，进入调试状态
wire rf_pause = sw_i[1];   // 查看 RF 时，暂停查看
wire alu_pause = sw_i[2];
wire dm_pause = sw_i[3];
wire initial_addr_sel = sw_i[5:2];
wire rom_disp = sw_i[14], rf_disp = sw_i[13], alu_disp = sw_i[12], dm_disp = sw_i[11], imm_disp = sw_i[10], pc_disp = sw_i[9]; // 六种互斥的查看状态
```



