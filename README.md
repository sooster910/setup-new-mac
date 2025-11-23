# 🍎 Setup New Mac

새 맥북에 개발 환경을 자동으로 세팅하는 스크립트입니다.

한 번의 명령어로 필요한 모든 개발 도구와 애플리케이션을 설치할 수 있습니다.

## 📦 설치되는 것들

### Homebrew Formula
- **git** - 버전 관리
- **neovim** - 터미널 에디터

### Node 환경
- **NVM** (Node Version Manager) - Node 버전 관리자
- **Node v22.18.0** - JavaScript 런타임

### Cask Applications (GUI 앱)
- raycast, obsidian, rectangle, figma, cursor, postman, chrome, slack, wakatime, arc, grabit, docker, warp, daisyclean

## 🚀 빠른 시작

```bash
# 1. 스크립트 다운로드
git clone https://github.com/hyunsujoo/setup-new-mac.git
cd setup-new-mac

# 2. 실행 권한 부여
chmod +x setup.sh

# 3. 실행
./setup.sh
```

## 📋 상세 가이드

자세한 사용법은 [SETUP_GUIDE.md](./SETUP_GUIDE.md)를 참고하세요.

## ⚙️ 세팅 커스터마이징

특정 앱만 설치하고 싶다면 `setup.sh`를 수정하세요:

```bash
# setup.sh의 Step 5에서 필요한 앱만 선택
brew install --cask raycast obsidian rectangle figma
```

## ❓ 도움말

설치 중 문제가 발생하면 [SETUP_GUIDE.md](./SETUP_GUIDE.md)의 "문제 발생 시" 섹션을 참고하세요.

## 📝 라이선스

MIT

---

Happy coding! 🚀
