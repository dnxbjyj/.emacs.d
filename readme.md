<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [.emacs.d](#emacsd)
- [核心配置文件和目录结构](#核心配置文件和目录结构)
    - [init.el](#initel)
    - [site-lisp](#site-lisp)
        - [config](#config)
            - [init-config.el](#init-configel)
            - [init](#init)
                - [init-template.el](#init-templateel)
                - [common](#common)
                - [mode](#mode)
                - [extension](#extension)
                - [my-extension](#my-extension)
        - [org](#org)
        - [extension](#extension-1)
        - [my-extension](#my-extension-1)
    - [local-lisp](#local-lisp)
- [需要本地化适配的配置](#需要本地化适配的配置)
    - [init-local-path.el](#init-local-pathel)

<!-- markdown-toc end -->
# .emacs.d
我的Emacs配置。

# 核心配置文件和目录结构
## init.el
主入口文件，把所有的package路径递归加入`load-path`，并启动benchmark性能分析插件。

## site-lisp
开箱即用的模块化配置目录。

### config
模块化配置文件存放目录，包括如下配置文件和目录：

#### init-config.el
模块化配置入口配置文件，在其中只做一件事：加载各个package的init初始化配置文件。

#### init
各个package的初始化配置文件存放目录，包括如下配置文件和目录：

##### init-template.el
模块化package初始化配置模板文件，每一个package的初始化都要使用该模板文件。

##### common
通用初始化配置文件目录，包括如下配置文件：

- `init-better-default.el`: 更好的默认配置
- `init-local-path.el`: 本地化路径配置
- `init-my-awesome-function.el`: 自己编写的更好用的自定义函数
- `init-package.el`: package相关配置
- `init-pretty-hydra-one-key.el`: 基于hydra插件的快捷键统一配置（包含部分mode和插件的快捷键）
- `init-quick-access.el`: 快速访问配置
- `init-theme.el`: 主题配置
- `init-ui.el`: 界面相关配置

##### mode
各种mode的初始化配置文件目录，包括如下配置文件：

- `init-c-mode.el`：`c-mode`的配置
- `init-cmuscheme.el`：scheme编程环境相关配置
- `init-company-mode.el`: `company-mode`配置
- `init-dired-mode.el`: `dired-mode`配置
- `init-elisp-mode.el`: `elisp-mode`配置
- `init-eshell-mode.el`: `eshell-mode`配置
- `init-gud-mode.el`: `gud-mode`配置，Java代码debug工具
- `init-java-mode.el`: `java-mode`配置
- `init-markdown-mode.el`: `markdown-mode`配置
- `init-org-mode.el`: `org-mode`配置
- `init-paredit`：`paredit`配置，用于更好的括号编辑
- `init-parenface.el`：括号颜色配置
- `init-python-mode.el`: `python-mode`配置
- `init-sh-mode.el`：shell脚本相关配置
- `init-yaml-mode.el`：`yaml-mode`相关配置

##### extension
各种插件的初始化配置文件目录，包括如下配置文件：

- `init-anzu.el`：`anzu`插件配置，增强文本搜索
- `init-atomic-chrome.el`: 用emacs编辑浏览器的文本输入框的内容的插件配置
- `init-auto-save.el`: 自动保存插件配置
- `init-aweshell.el`：`aweshell`插件配置，增强shell
- `init-awesome-pair.el`: 更好的配对插件配置
- `init-awesome-tab.el`: Tab页插件配置
- `init-company-english-helper.el`: 英语小助手插件的配置
- `init-edit-server.el`: 编辑器服务后端配置
- `init-grep-dired.el`: 目录全文文本查找配置
- `init-helm.el`: helm插件配置
- `init-insert-translated-name.el`: 插入翻译的中英文单词插件配置
- `init-lazy-search.el`: `lazy-search`插件配置
- `init-leetcode.el`: leetcode刷题插件配置
- `init-org-pomodoro.el`: `org-mode`番茄钟配置
- `init-pretty-hydra.el`：更好的hydra快捷键配置
- `init-projectile.el`: projectile插件配置
- `init-pyim.el`: pyim输入法插件配置
- `init-sift.el`: sift全文搜索插件配置
- `init-smex.el`: smex插件配置
- `init-use-package`：`use-package`插件配置
- `init-valign`：`valign`插件配置，用于`org-mode`的表格对齐
- `init-virtualenvwrapper.el`: 虚拟环境插件配置
- `init-watch-other-window.el`: 浏览另一个窗口插件配置
- `init-youdao-dictionary.el`: 有道词典插件配置


##### my-extension
自己写的插件的初始化配置文件目录，包括：

- `init-pasteex-mode.el`: `pasteex-mode`配置文件，用于在`org-mode`和`markdown-mode`一键插入图片

### org
快速访问入口org配置文件，包括如下配置文件：

- `quick-access.org`: 全局的快速访问入口org配置文件

### extension
第三方插件代码文件存放目录，每一个插件（及其依赖）都放在独立子目录中。

- `themes`: 主题插件
- `auto-save`: 自动保存插件
- `youdao-dictionary`: 有道词典插件
- ...

### my-extension
自己写的插件存放目录，包括：

- `pasteex`: `org-mode`和`markdown-mode`下的剪贴板图片一键插入工具


## local-lisp
本地化的模块化配置目录，包括如下配置文件：
- `init-quick-access-local.el`: 本地化的快速访问配置文件
- `quick-access-local.org`: 本地化的快速访问org配置文件

# 需要本地化适配的配置
## init-local-path.el
- 存放位置：`site-lisp/config/init/common/init-local-path.el`
- 说明：本地化的路径参数配置。

