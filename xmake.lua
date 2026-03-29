--- @file xmake.lua
--- @brief OMR Robotics 仓库构建入口
--- @details 先加载 oh-my-robot 底座，再对外聚合领域层头文件与底座能力。
set_project("omr-robotics")
set_xmakever("3.0.7")
add_rules("mode.debug", "mode.release")

includes("oh-my-robot")

target("tar_omr_robotics")
    set_kind("headeronly")
    add_deps("tar_oh_my_robot", {public = true})
    add_includedirs("lib/include", {public = true})
target_end()
