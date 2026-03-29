# OMR Robotics 分层规范

本文档用于定义 `omr-robotics` 作为“领域应用库”时的职责边界。

## 角色定位
- `oh-my-robot`
  - 底座子模块，位于 `oh-my-robot/`，提供 `core / osal / sync / async / services / drivers / bsp / build`。
- `omr-robotics`
  - 领域应用库，负责机器人机构与业务模块。
- 项目仓库
  - 负责项目参数、入口、任务装配与最终镜像。

## 依赖规则
- `omr-robotics` 通过仓内 `oh-my-robot/` 子模块依赖底座的公开头文件与公开聚合目标。
- `omr-robotics` 不得依赖 `oh-my-robot/platform/*`、`oh-my-robot/platform/bsp/*` 的私有实现头。
- 领域模块之间可以按“机构层 -> 组合层 -> 整机层”依赖，不得形成循环依赖。
- 项目仓库可以依赖 `omr-robotics`，但 `omr-robotics` 不得反向持有项目仓库配置。

## 首批建议模块
- `modules/chassis/`
- `modules/gimbal/`
- `modules/arm/`
- `modules/referee/`
- `modules/supercap/`
- `modules/robot/`

## 当前迁移状态
- 已建立首批领域目录与公开接口：
  - `arm`
  - `chassis`
  - `gimbal`
  - `robot`
  - `supercap`
- 构建入口由 `tar_omr_robotics` 对外统一暴露，并 `public` 传播 `tar_oh_my_robot`。
- 目前 `supercap` 只完成了头文件与最小源码骨架，尚未补齐完整业务逻辑。
- 后续新增机器人业务模块应直接进入本仓。
