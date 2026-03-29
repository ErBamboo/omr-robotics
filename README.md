# omr-robotics

`omr-robotics` 是位于 `oh-my-robot` 之上的领域应用库仓库，用于承载机器人业务相关模块，而不是平台、OS 或设备抽象本身。

## Scope
- 负责机器人领域模块，例如 `chassis`、`gimbal`、`arm`、`referee`、`supercap`、整机状态机与机构编排。
- 通过仓内 `oh-my-robot/` 子模块依赖底座能力，不反向侵入 `platform/`、`bsp/`、OSAL 私有实现。
- 不直接承担具体项目的参数表、设备 ID、标定值、比赛策略与最终镜像入口，这些内容应留在项目仓库。

## Layout
- `oh-my-robot/`
  - 底座子模块，当前先跟随 `feature/18-three-layer-architecture-split`，待上游合入后再切回稳定基线。
- `docs/architecture/`
  - 领域层边界与模块依赖说明。
- `lib/include/robotics/`
  - 领域层公开头文件入口。
- `modules/`
  - 具体领域模块实现。

## Current Modules
- 首批已建立的领域目录：
  - `modules/arm/`
  - `modules/chassis/`
  - `modules/gimbal/`
  - `modules/robot/`
  - `modules/supercap/`
- 当前已建立 `robotics/supercap/supercap.h` 作为公开入口，`tar_omr_robotics` 作为对外统一聚合目标。
- `supercap` 仍处于“接口先行、具体业务实现待补齐”的阶段，后续应按设备模型与机构语义继续完善。
