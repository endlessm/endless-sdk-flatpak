kind: manual

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst

config:
  install-commands:
  - mkdir -p %{install-root}%{datadir}/javascript/mathjax
  - mv MathJax.js %{install-root}%{datadir}/javascript/mathjax
  - mv config %{install-root}%{datadir}/javascript/mathjax
  - mv extensions %{install-root}%{datadir}/javascript/mathjax
  - mv images %{install-root}%{datadir}/javascript/mathjax
  - mv jax %{install-root}%{datadir}/javascript/mathjax
  - mv localization %{install-root}%{datadir}/javascript/mathjax
  - mv test %{install-root}%{datadir}/javascript/mathjax
  - mv unpacked %{install-root}%{datadir}/javascript/mathjax
  - mkdir -p %{install-root}%{datadir}/javascript/mathjax/fonts/HTML-CSS/TeX
  - mv fonts/HTML-CSS/TeX/otf %{install-root}%{datadir}/javascript/mathjax/fonts/HTML-CSS/TeX
  - mv fonts/HTML-CSS/TeX/svg %{install-root}%{datadir}/javascript/mathjax/fonts/HTML-CSS/TeX
  - mv fonts/HTML-CSS/TeX/woff %{install-root}%{datadir}/javascript/mathjax/fonts/HTML-CSS/TeX

sources:
- kind: git_tag
  url: github_com:mathjax/MathJax
  track: 2.4.0
  ref: 2.4.0-0-g1c54436ae6166a91495aba8a98cc18816b4789df
