# 🚀 CONFIGURAÇÃO COMPLETA DO WORKSPACE ROS COM SSH

Autor: **Vito Franzosi**  
📧 vitofranzosi@exemplo.com  

---

## 🧱 Estrutura final esperada

```bash
rosbot3_simulation/
├── src/
│   ├── ros_commons/           (submódulo)
│   ├── rosbot3_description/   (submódulo)
│   └── rosbot3_gazebo/        (submódulo)
└── README.md

🧩 1. Criar e configurar a autenticação SSH
-------------------------------------------
  🔹 Gerar chave SSH
       sh-keygen -t ed25519 -C "seu_email@exemplo.com"
  🔹 Adicionar chave ao agente
       eval "$(ssh-agent -s)"
       ssh-add ~/.ssh/id_ed25519
  🔹 Adicionar chave ao GitHub
     Copie a chave pública:
       cat ~/.ssh/id_ed25519.pub
     Depois, acesse:
       GitHub → Settings → SSH and GPG keys → New SSH key
       Cole a chave e clique em Add SSH key.
  🔹 Testar conexão
       ssh -T git@github.com
     Se tudo estiver certo:
       Hi vitofranzosi! You've successfully authenticated, but GitHub does not provide shell access.

🧩 2. Criar os repositórios no GitHub
-------------------------------------

