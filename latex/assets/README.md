# 联系方式与链接图标

本目录提供七种矢量 PDF 图标，不依赖编译机器安装图标字体。所有图标使用统一的正方形画布、蓝色 `#4285F4` 和相对字号，适用于联系方式及学术主页链接。

| 文件 | 用途 | LaTeX 命令 |
| --- | --- | --- |
| `email.pdf` | 邮箱 | `\resumeemailicon` |
| `phone.pdf` | 电话 | `\resumephoneicon` |
| `location.pdf` | 所在地／地址 | `\resumelocationicon` |
| `github.pdf` | GitHub | `\resumegithubicon` |
| `homepage.pdf` | 个人主页 | `\resumehomepageicon` |
| `web.pdf` | 导师介绍或其他网页 | `\resumewebicon` |
| `google-scholar.pdf` | Google Scholar | `\resumescholaricon` |

在使用 `academic-cv.cls` 的文档中，可将图标与文字共同作为链接：

```tex
\href{mailto:name@example.com}{\resumeemailicon name@example.com}
\href{tel:+8613800000000}{\resumephoneicon [电话号码]}
\resumelocationicon [城市]
\href{https://github.com/your-username}{\resumegithubicon GitHub}
\href{https://example.com}{\resumehomepageicon 个人主页}
```

使用前替换示例联系方式与网址。默认模板展示邮箱、电话、所在地与 Scholar；GitHub 和个人主页可按申请需要替换现有链接。地点通常写城市即可；图标旁保留文字，避免仅用图标表达含义。

## 来源

- `google-scholar.pdf`：Google Scholar 字形，来自 James Walsh 设计的 [Academicons 1.9.1](https://jpswalsh.github.io/academicons/)。
- 其余图标：envelope、phone、map-marker-alt、github、home、globe 字形，来自 Fort Awesome 的 [Font Awesome 5 Free](https://fontawesome.com/license/free)。

上述字体随 TeX Live 提供，字体原件采用 [SIL Open Font License 1.1](https://openfontlicense.org/open-font-license-official-text/)。这里仅提供由字形生成的矢量图形，未分发字体文件或 LaTeX 图标宏包。标识对应的商标归各自权利人所有。
