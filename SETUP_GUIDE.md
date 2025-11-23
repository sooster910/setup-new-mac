# 🍎 새 맥북 개발 환경 자동 설치 가이드

새 맥북에서 한 번의 명령어로 개발 환경을 완벽하게 세팅할 수 있습니다.

## 📋 설치되는 것들

### Homebrew Formula
- **git** - 버전 관리
- **neovim** - 에디터

### Node 환경
- **NVM** (Node Version Manager) - Node 버전 관리자
- **Node v22.18.0** - JavaScript 런타임

### Cask Applications (GUI 앱)
- raycast - 맥 런처
- obsidian - 노트 앱
- rectangle - 윈도우 관리
- figma - 디자인 도구
- cursor - AI 코드 에디터
- postman - API 테스트
- chrome - 브라우저
- slack - 커뮤니케이션
- wakatime - 코딩 시간 추적
- arc - 브라우저
- grabit - 스크린샷
- docker - 컨테이너 플랫폼
- warp - 터미널
- daisyclean - 앱 정리 도구

---

## 🚀 사용 방법

### Step 1: 리포지토리 클론
```bash
git clone https://github.com/hyunsujoo/setup-new-mac.git
cd setup-new-mac
```

또는 파일을 직접 다운로드:
- GitHub에서 ZIP으로 다운로드
- USB, AirDrop, iCloud Drive 등으로 전송

### Step 2: 스크립트 실행 권한 부여
```bash
chmod +x setup.sh
```

### Step 3: 스크립트 실행
```bash
./setup.sh
```

### Step 4: 기다리기
스크립트가 자동으로 모든 것을 설치합니다.
- Homebrew 설치 (필요시)
- 필수 도구 설치
- NVM과 Node 설치
- 모든 Cask 앱 설치

**설치 시간**: 10-30분 (인터넷 속도에 따라 다름)

### Step 5: 확인
```bash
node -v      # v22.18.0
npm -v       # npm 버전 확인
git --version # Git 버전 확인
```

---

## ⚙️ NVM으로 Node 버전 관리하기

```bash
# 설치된 Node 버전 확인
nvm list

# 다른 버전 설치
nvm install 20.11.0

# 버전 전환
nvm use 22.18.0

# 기본 버전 설정
nvm alias default 22.18.0
```

### 프로젝트별 Node 버전 설정
프로젝트 루트에 `.nvmrc` 파일 생성:
```
22.18.0
```

그 후 `nvm use` 실행하면 자동으로 버전 전환:
```bash
nvm use
```

---

## 🔧 수동 설정 필요한 것들

### Git 설정
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### SSH 키 설정 (회사 가이드 참고)
```bash
# 새 SSH 키 생성
ssh-keygen -t ed25519 -C "your.email@company.com"

# 공개 키 확인
cat ~/.ssh/id_ed25519.pub
```

### 에디터 설정
- Cursor, VSCode 등을 열고 개인 설정 또는 회사 설정 적용

---

## ⚠️ 주의사항

1. **인터넷 연결 필수** - 모든 파일을 다운로드합니다
2. **관리자 암호 필요** - 설치 중 여러 번 입력 요청
3. **시간 소요** - 앱이 많으므로 시간이 걸립니다
4. **새로운 맥북 권장** - 기존 설치와의 충돌을 피하기 위해

---

## ❓ 문제 발생 시

### "Permission denied" 에러
```bash
chmod +x setup.sh
```

### Homebrew 설치 중 에러
```bash
# Homebrew 설치 스크립트 직접 실행
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### NVM 설치 후 `nvm` 명령어를 찾을 수 없음
터미널을 재시작하거나:
```bash
source ~/.zshrc
```

### 특정 Cask 앱 설치 실패
```bash
# 개별 앱 설치 시도
brew install --cask raycast
```

### Apple Silicon (M1/M2/M3) Mac에서 문제
일부 구형 앱은 Apple Silicon을 지원하지 않을 수 있습니다.
필요시 Rosetta 2를 통해 실행하거나 대체 앱을 찾아보세요.

---

## 💡 팁

1. **설치 후 첫 실행**
   - 각 앱을 한 번씩 실행해서 초기 설정 진행

2. **선택적 설치**
   - 모든 앱이 필요 없다면 `setup.sh`를 수정해서 필요한 앱만 설치

3. **정기적 업데이트**
   ```bash
   brew update
   brew upgrade
   ```

4. **설치된 앱 확인**
   ```bash
   brew list --cask
   ```

---

**설치 완료 후 새로운 개발 환경에서 즐거운 코딩되세요! 🚀**
