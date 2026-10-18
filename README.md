<h1 align="center">Academic CV Templates</h1>

<p align="center">
  中英文学术简历模板，提供 LaTeX 与 Word 两种格式，<br>
  适用于研究生申请、科研岗位申请及学术交流。
</p>

<p align="center">
  Bilingual academic CV templates in Chinese and English, available in LaTeX and Word,<br>
  for graduate admissions, research positions, and academic exchange.
</p>

<p align="center">
  <a href="latex/">
    <img src="https://img.shields.io/badge/LaTeX-XeLaTeX-008080?style=flat-square&amp;logo=latex&amp;logoColor=white" alt="LaTeX · XeLaTeX">
  </a>
  <a href="word/">
    <img src="https://img.shields.io/badge/Word-DOCX-185ABD?style=flat-square" alt="Word · DOCX">
  </a>
  <a href="#模板预览">
    <img src="https://img.shields.io/badge/Languages-ZH%20%7C%20EN-64748B?style=flat-square" alt="中文与 English 双语模板">
  </a>
</p>

<p align="center">
  <a href="#模板预览">模板预览</a> ·
  <a href="#快速开始">快速开始</a> ·
  <a href="docs/writing-guide.md">填写指南</a>
</p>

主要面向本科高年级学生、硕士生、博士生及近期毕业生。正文使用通用填写提示：将 `[...]` 和 `20XX` 替换为本人信息，删除不适用的条目即可。

## 模板预览

LaTeX 版采用 A4 单栏，左上角预留院校校徽，中间为两行个人信息，右上角预留照片。中文正文为 13 pt，标题使用粗体黑体；教育背景按列对齐，实习的单位、部门和日期同行展示。中英文共用样式文件，页数随内容调整。下图为首页预览，完整内容见 PDF。

| 中文版 | English |
| --- | --- |
| ![中文 LaTeX 模板预览](docs/previews/academic-cv-zh.png) | ![English LaTeX template preview](docs/previews/academic-cv-en.png) |
| [查看 PDF](examples/academic-cv-zh.pdf) · [LaTeX 源码](latex/academic-cv-zh.tex) | [View PDF](examples/academic-cv-en.pdf) · [LaTeX source](latex/academic-cv-en.tex) |

## Word 模板

经典版分行展示联系方式，紧凑版将联系方式集中展示；两种版式均提供中英文、彩色和黑白版本。Word 与 LaTeX 的版式和正文分别维护。

| 语言 | 版式 | 彩色版 | 黑白版 |
| --- | --- | --- | --- |
| 中文 | 经典版 | [下载](word/academic-cv-zh-classic-color.docx) | [下载](word/academic-cv-zh-classic-mono.docx) |
| 中文 | 紧凑版 | [下载](word/academic-cv-zh-compact-color.docx) | [下载](word/academic-cv-zh-compact-mono.docx) |
| English | Classic | [Download](word/academic-cv-en-classic-color.docx) | [Download](word/academic-cv-en-classic-mono.docx) |
| English | Compact | [Download](word/academic-cv-en-compact-color.docx) | [Download](word/academic-cv-en-compact-mono.docx) |

## 快速开始

### Word

下载对应 `.docx` 文件，用 Microsoft Word 替换个人信息和填写提示。右键左上角校徽占位图，选择“更改图片”换成本人就读或毕业院校的校徽；照片同理。不需要的图片可选中后删除。导出 PDF 后检查分页、字体和链接。

### Overleaf

将 `latex/` 内的文件上传到 Overleaf 项目根目录，**保留 `assets/` 子目录**。将编译器设为 **XeLaTeX**，选择 `academic-cv-zh.tex` 或 `academic-cv-en.tex` 为主文件即可。

### 本地编译

安装含 XeLaTeX 的 TeX Live、MacTeX 或 MiKTeX。模板使用发行版提供的 Fandol Kai、Fandol Hei 和 TeX Gyre Termes，无需额外安装商业字体。在仓库根目录运行：

```sh
make             # 编译中英文版本，更新 examples/ 中的 PDF
make zh          # 仅编译中文版，输出到 latex/build/
make en          # 仅编译英文版，输出到 latex/build/
make preview     # 更新 PDF 和预览图，另需 pdftoppm（Poppler）
make clean       # 清理辅助文件，保留 PDF
```

以上命令需要 `make` 和 `latexmk`；也可在 `latex/` 中直接执行 `xelatex academic-cv-zh.tex` 或 `xelatex academic-cv-en.tex`。

## 校徽与照片

校徽使用**申请人就读或毕业院校**的标识，保持原始比例；模板默认显示占位框。在 `latex/` 中放入自己的图片，并在对应 `.tex` 文件中取消以下命令的注释：

```tex
\setresumelogo{university-logo.png}  % 校徽：等比缩放到 22 × 22 mm 范围内
\setresumephoto{photo.jpg}          % 照片：等比缩放到 25 × 30 mm 范围内
```

无需校徽时使用 `\hideresumelogo` 隐藏校徽和占位框。`latex/university-logo.*` 与 `latex/photo.*` 已加入 Git 忽略规则。图片是否使用以申请要求为准。

模板附带邮箱、电话、所在地、GitHub、个人主页、Scholar 及网络图标，尺寸与风格统一。顶部默认使用邮箱、电话、所在地与 Scholar；其他账号按需替换，保留可读文字。示例网址和联系方式需替换为本人信息。

```tex
\href{https://example.com/scholar}{\resumescholaricon Scholar}
\href{https://example.com/advisor}{\resumewebicon [导师姓名]}
\href{https://github.com/your-username}{\resumegithubicon GitHub}
\href{https://example.com}{\resumehomepageicon 个人主页}
```

完整命令及来源见 [图标说明](latex/assets/README.md)。所在地通常写城市即可。

## 填写建议

- 科研成果可按论文、专利、著作分组；论文使用规范引用，`\cvname{本人姓名}` 可加粗并加下划线。
- 奖项可归入对应教育经历，每项竞赛独立一行；也可按需要单独设栏目。
- 实习中的项目直接写入该段经历，保留方法、本人工作与结果；独立项目可启用源码中的可选模块，避免重复描述。
- 专业能力写实际方法及能完成的任务，语言成绩附考试年份。自我评价按需启用，不以空泛评价代替经历。
- 在读状态、成果状态和个人贡献应准确，中英文保持一致。没有相关经历的栏目直接删除。
- 经历较少时一页即可，内容较多时可扩展；优先遵循申请方的格式与页数要求。

更多栏目取舍与申请场景说明见[学术申请简历填写指南](docs/writing-guide.md)。字体、页边距和栏目间距可在 `latex/academic-cv.cls` 中调整。

## 目录与许可

`latex/` 保存 LaTeX 源码，`word/` 保存八种 Word 模板，`examples/` 保存示例 PDF，`docs/` 保存填写指南和预览图。文件名中的 `zh` / `en` 表示语言，`classic` / `compact` 表示版式，`color` / `mono` 表示配色。

LaTeX 源码与构建脚本沿用原模板的 [MIT 许可证](LICENSE)。Word 文档为既有模板的整理版本，原文件未附独立许可声明。字体由本地 TeX 发行版提供，本仓库不分发字体文件；附带图标的来源见 [图标说明](latex/assets/README.md)。

## 简历制作与学习资源

以下为外部官方资源，可结合目标院校和学科要求阅读：

- [牛津大学 Careers Service：Academic CVs](https://www.careers.ox.ac.uk/academic-cvs)：学术简历的结构、内容选择与示例，适合先了解学术申请简历应写什么。
- [Purdue OWL：Writing the Curriculum Vitae](https://owl.purdue.edu/owl/job_search_writing/resumes_and_vitas/writing_the_cv.html)：CV 的组织方式与写作建议，帮助梳理教育、研究及相关经历。
- [Overleaf：Learn LaTeX in 30 minutes](https://www.overleaf.com/learn/latex/Learn_LaTeX_in_30_minutes)：LaTeX 入门教程，适合第一次修改 `.tex` 模板的使用者。

外部指南用于学习参考；具体格式、页数及材料要求以申请单位的说明为准。
