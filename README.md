# 🍎 Setup New Mac

새 맥북에 개발 환경을 자동으로 세팅하는 스크립트입니다.

각 단계별로 독립적으로 실행할 수 있어 에러 추적과 재시도가 용이합니다.

## 📦 설치되는 것들

### Homebrew Formula
- **git** - 버전 관리
- **neovim** - 터미널 에디터

### Node 환경
- **NVM** (Node Version Manager) - Node 버전 관리자
- **Node v22.18.0** - JavaScript 런타임

### 터미널 환경
- **Oh-My-Zsh** - 쉘 프레임워크
- **Powerlevel10k** - 테마

### Fonts
- **Maple Mono** - 코딩 폰트
- **D2 Coding** - 한글 지원 코딩 폰트
- **D2 Coding Nerd Font** - 아이콘 지원 폰트

### Cask Applications (GUI 앱)
- raycast, obsidian, rectangle, figma, cursor, postman, chrome, slack, wakatime, arc, grabit, docker, warp, daisyclean

### Cursor Editor
- 150+ 개발 확장 프로그램
- 커스텀 설정 (폰트, 테마, 레이아웃)

## 🚀 빠른 시작

### 방법 1: Step별로 따로 실행 (권장)

```bash
# 1. 리포지토리 클론
git clone https://github.com/sooster910/setup-new-mac.git
cd setup-new-mac

# 2. 각 step을 순서대로 실행
./steps/01-homebrew.sh
./steps/02-formula.sh
./steps/03-nvm.sh
./steps/04-node.sh
./steps/05-cask.sh
./steps/06-zsh.sh
./steps/07-cursor.sh   # Cursor 설정 (선택사항)
```

### 방법 2: 특정 step만 실행

```bash
# Step 5만 다시 실행 (이미 1-4는 설치됨)
./steps/05-cask.sh
```

### 방법 3: 전체 자동 실행

```bash
# 모든 step을 한 번에 실행
chmod +x setup.sh
./setup.sh
```

## 📋 상세 가이드

자세한 사용법은 [SETUP_GUIDE.md](./SETUP_GUIDE.md)를 참고하세요.

## 📂 구조

```
setup-new-mac/
├── setup.sh              (전체 자동 실행)
├── steps/
│   ├── 01-homebrew.sh   (Homebrew 설치)
│   ├── 02-formula.sh    (git, neovim 설치)
│   ├── 03-nvm.sh        (NVM 설치)
│   ├── 04-node.sh       (Node 설치)
│   ├── 05-cask.sh       (앱 설치)
│   ├── 06-zsh.sh        (zsh 설정)
│   └── 07-cursor.sh     (Cursor 설정 및 확장)
├── cursor-config/
│   ├── settings.json     (Cursor 설정)
│   └── extensions-list.txt (확장 프로그램 목록)
├── README.md
└── SETUP_GUIDE.md
```

## ⚠️ 주의사항

- 각 step은 순서대로 실행해야 합니다
- Step 1 (Homebrew)을 먼저 실행하지 않으면 다른 step들이 실패할 수 있습니다
- 인터넷 연결이 필수입니다

## ❓ 도움말

설치 중 문제가 발생하면 [SETUP_GUIDE.md](./SETUP_GUIDE.md)의 "문제 발생 시" 섹션을 참고하세요.

## 📝 라이선스

MIT

---

Happy coding! 🚀
