# 🍎 새 맥북 개발 환경 자동 설치 가이드

새 맥북에서 개발 환경을 세팅하는 방법을 자세히 설명합니다.

## 📋 설치되는 것들

### Homebrew Formula
- **git** - 버전 관리
- **neovim** - 터미널 에디터

### Node 환경
- **NVM** (Node Version Manager) - Node 버전 관리자
- **Node v22.18.0** - JavaScript 런타임

### 터미널 환경
- **Oh-My-Zsh** - 쉘 프레임워크
- **Powerlevel10k** - 테마

### 폰트
- **Maple Mono** - 코딩 폰트
- **D2 Coding** - 한글 지원 코딩 폰트
- **D2 Coding Nerd Font** - 아이콘 지원 폰트

### Cask Applications (GUI 앱)
- raycast, obsidian, rectangle, figma, cursor, postman, chrome, slack, wakatime, arc, grabit, docker, warp, daisyclean

---

## 🚀 사용 방법

### Step 1: 리포지토리 클론
```bash
git clone https://github.com/sooster910/setup-new-mac.git
cd setup-new-mac
```

또는 파일을 직접 다운로드:
- GitHub에서 ZIP으로 다운로드
- USB, AirDrop, iCloud Drive 등으로 전송

### Step 2: 각 step 실행

#### 방법 A: Step별로 따로 실행 (권장)

**가장 안전하고 에러 추적이 쉬운 방법입니다.**

```bash
# Step 1: Homebrew 설치
./steps/01-homebrew.sh

# Step 2: Git, Neovim 설치
./steps/02-formula.sh

# Step 3: NVM 설치
./steps/03-nvm.sh

# Step 4: Node v22.18.0 설치
./steps/04-node.sh

# Step 5: 앱 설치 (시간이 걸립니다)
./steps/05-cask.sh

# Step 6: Zsh 설정
./steps/06-zsh.sh
```

#### 방법 B: 전체 자동 실행

**모든 step을 한 번에 실행합니다.**

```bash
chmod +x setup.sh
./setup.sh
```

#### 방법 C: 특정 step만 실행

**이미 설치된 step을 스킵하고 싶을 때:**

```bash
# Step 5만 실행 (Step 1-4는 이미 설치됨)
./steps/05-cask.sh

# Step 3 재실행 (실패했을 경우)
./steps/03-nvm.sh
```

---

## ⚙️ 각 Step 상세 설명

### Step 1: Homebrew 설치
- macOS 패키지 매니저 설치
- 다른 모든 step의 기반
- **의존성: 없음**

### Step 2: Formula 설치
- Git (버전 관리)
- Neovim (터미널 에디터)
- **의존성: Step 1 필수**

### Step 3: NVM 설치
- Node Version Manager
- Node 버전 관리 가능
- **의존성: Step 1 필수**

### Step 4: Node 설치
- Node v22.18.0
- NPM도 함께 설치됨
- **의존성: Step 3 필수**

### Step 5: Cask 앱 설치
- 14개의 GUI 애플리케이션 설치
- 3개의 폰트 설치
- 시간이 가장 오래 걸림 (10-20분)
- **의존성: Step 1 필수**

### Step 6: Zsh 설정
- Oh-My-Zsh 설치
- Powerlevel10k 테마 설치
- .zshrc 설정
- 기본 쉘을 zsh로 변경
- **의존성: 없음**

---

## 💻 설치 완료 후

### 터미널 재시작
새로운 터미널 탭을 열어야 설정이 적용됩니다.

또는:
```bash
source ~/.zshrc
```

### 버전 확인
```bash
node -v        # v22.18.0
npm -v         # npm 버전
git --version  # git 버전
zsh --version  # zsh 버전
```

### 폰트 설정 (에디터)
installed fonts는 `~/Library/Fonts/`에 저장됩니다.
- **Cursor**: Settings → Font Family → "Maple Mono" 또는 "D2 Coding"
- **VSCode**: Settings → Font Family → "Maple Mono Italic[wght]"
- **터미널**: System Preferences → Profiles → Font → "D2 Coding Nerd Font"

---

## ⚠️ 주의사항

1. **인터넷 연결 필수** - 모든 파일을 다운로드합니다
2. **관리자 암호 필요** - 설치 중 여러 번 입력 요청
3. **순서 중요** - Step 1-4는 순서대로 실행해야 합니다
4. **시간 소요** - 전체 설치에 20-40분 소요

---

## ❓ 문제 발생 시

### "Permission denied" 에러
```bash
chmod +x steps/*.sh
```

### Homebrew 설치 실패
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### NVM 명령어를 찾을 수 없음
```bash
# 터미널 재시작 또는
source ~/.zshrc

# 또는 수동으로 NVM 로드
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
```

### 특정 Cask 앱 설치 실패
개별 설치 시도:
```bash
brew install --cask raycast
brew install --cask figma
```

### Apple Silicon (M1/M2/M3) Mac에서 호환성 문제
일부 구형 앱은 네이티브로 지원되지 않을 수 있습니다.
필요시 Rosetta 2를 통해 실행하거나 대체 앱을 찾아보세요.

### Step 5 (Cask 설치)가 너무 오래 걸림
정상입니다. 14개 앱과 3개 폰트 설치에 10-20분이 소요됩니다.

### 쉘이 bash로 변경되었을 때
```bash
chsh -s /bin/zsh
```

---

## 💡 팁

1. **선택적 설치**
   - 모든 앱이 필요 없으면 `steps/05-cask.sh`를 수정하세요

2. **정기적 업데이트**
   ```bash
   brew update
   brew upgrade
   ```

3. **설치된 앱 확인**
   ```bash
   brew list --cask
   ```

4. **이미 설치된 것 건너뛰기**
   - 각 script는 자동으로 이미 설치된 항목을 감지하고 건너뜁니다

---

## 📞 지원

문제가 해결되지 않으면:
1. 이 문서를 다시 읽어보세요
2. GitHub Issues에서 유사한 문제를 찾아보세요
3. GitHub Issues에 새로운 이슈를 등록하세요

---

**설치 완료 후 새로운 개발 환경에서 즐거운 코딩되세요! 🚀**
