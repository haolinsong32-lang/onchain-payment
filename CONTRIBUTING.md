# Contributing to SUKA.net

感谢你对 SUKA.net 的关注和贡献！本项目致力于打造 AI Agent 链上支付的基础设施层。

## 行为准则

- 尊重所有贡献者，保持专业和建设性的交流
- 提交前请确保代码通过基本测试
- 重大变更请先开 Issue 讨论方案

## 如何贡献

### 🐛 报告 Bug

1. 搜索 [Issues](../../issues) 确认未被报告过
2. 使用 **Bug Report** 模板提交，提供：
   - 复现步骤
   - 预期行为 vs 实际行为
   - 浏览器 / 钱包版本
   - 截图（如有）

### 💡 功能建议

1. 使用 **Feature Request** 模板提交
2. 描述使用场景和期望效果
3. 标注是否愿意自行实现

### 🔧 提交代码

```bash
# 1. Fork 并 Clone
git clone https://github.com/YOUR_USERNAME/onchain-payment.git
cd onchain-payment

# 2. 创建分支（命名: feat/xxx, fix/xxx, docs/xxx）
git checkout -b feat/my-feature

# 3. 复制配置
cp config.example.json config.json
# 编辑 config.json 填入你的测试配置

# 4. 开发 & 测试
# 直接用浏览器打开 index.html 即可预览

# 5. 提交
git add .
git commit -m "feat: add my feature"

# 6. 推送并发起 PR
git push origin feat/my-feature
```

### Commit 规范

遵循 [Conventional Commits](https://www.conventionalcommits.org/)：

| 类型 | 说明 |
|------|------|
| `feat` | 新功能 |
| `fix` | Bug 修复 |
| `docs` | 文档更新 |
| `style` | 代码格式（不影响功能） |
| `refactor` | 重构 |
| `perf` | 性能优化 |
| `test` | 测试相关 |
| `chore` | 构建/工具链 |

示例：`feat: add Solana chain support`

### PR 审核流程

1. PR 标题遵循 Commit 规范
2. 关联相关 Issue（`Closes #123`）
3. CI 检查通过后，维护者会进行 Code Review
4. 至少 1 位维护者 Approve 后合并

## 项目结构

```
onchain-payment/
├── index.html          # 主服务页面（SPA）
├── config.example.json # 配置模板
├── marketing/          # 营销页面与素材
├── redirect/           # DNS 重定向页面
├── docs/               # 文档（未来）
└── .github/            # CI/CD & Issue 模板
```

## 开发环境

- 无需构建工具，纯静态 HTML/CSS/JS
- 直接用浏览器打开 `index.html` 即可开发
- 推荐 VS Code + Live Server 插件

## 联系方式

- Issue: [GitHub Issues](../../issues)
- 飞书群: SUKA TradingView

---

再次感谢你的贡献！🎉
