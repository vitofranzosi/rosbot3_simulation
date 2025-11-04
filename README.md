# 🚀 CONFIGURAÇÃO COMPLETA DO WORKSPACE ROS COM SSH

Autor: **Vito Franzosi**  
📧 vitofranzosi@gmail.com  

---

## 🧱 Estrutura final esperada

```bash
rosbot3_simulation/
├── src/
│   ├── ros_commons/           (submódulo)
│   ├── rosbot3_description/   (submódulo)
│   └── rosbot3_gazebo/        (submódulo)
└── README.md
```

## 🧩 1. Criar e configurar a autenticação SSH

  🔹 Gerar chave SSH
  ```bash
       sh-keygen -t ed25519 -C "seu_email@exemplo.com"
  ```
  🔹 Adicionar chave ao agente
  ```bash
       eval "$(ssh-agent -s)"
       ssh-add ~/.ssh/id_ed25519
  ```
  🔹 Adicionar chave ao GitHub
  ```bash
     Copie a chave pública:
       cat ~/.ssh/id_ed25519.pub
     Depois, acesse:
       GitHub → Settings → SSH and GPG keys → New SSH key
       Cole a chave e clique em Add SSH key.
  ```
  🔹 Testar conexão
  ```bash
       ssh -T git@github.com
       
       Se tudo estiver certo:
         Hi vitofranzosi! You've successfully authenticated, but GitHub does not provide shell access.
  ```

## 🧩 2. Criar os repositórios no GitHub

Crie quatro repositórios vazios (sem README, .gitignore ou licença):
1. ros_commons
2. rosbot3_description
3. rosbot3_gazebo
4. rosbot3_simulation (workspace principal)
Todos podem ser públicos ou privados.

## 🧩 3. Criar e enviar cada pacote localmente

Execute os comandos dentro da pasta onde você trabalha
(por exemplo: ~/ROS2AMR/docker/docker_environment).

📦 ros_commons
```bash
  cd ~/ROS2AMR/docker/docker_environment
  mkdir ros_commons && cd ros_commons
  git init
  echo "# ros_commons
  Pacote contendo utilitários e bibliotecas comuns para o ROSBot3." > README.md
  git add README.md
  git commit -m "Commit inicial do ros_commons"
  git branch -M main
  git remote add origin git@github.com:vitofranzosi/ros_commons.git
  git push -u origin main
```

📦 rosbot3_description
```bash
  cd ~/ROS2AMR/docker/docker_environment
  mkdir rosbot3_description && cd rosbot3_description
  git init
  echo "# rosbot3_description
  Pacote com a descrição e modelos URDF do ROSBot3." > README.md
  git add README.md
  git commit -m "Commit inicial do rosbot3_description"
  git branch -M main
  git remote add origin git@github.com:vitofranzosi/rosbot3_description.git
  git push -u origin main
```

📦 rosbot3_gazebo
```bash
  cd ~/ROS2AMR/docker/docker_environment
  mkdir rosbot3_gazebo && cd rosbot3_gazebo
  git init
  echo "# rosbot3_gazebo
  Pacote de simulação no Gazebo para o ROSBot3." > README.md
  git add README.md
  git commit -m "Commit inicial do rosbot3_gazebo"
  git branch -M main
  git remote add origin git@github.com:vitofranzosi/rosbot3_gazebo.git
  git push -u origin main
```

## 🧩 4. Criar o workspace principal
```bash
  cd ~/ROS2AMR/docker/docker_environment
  mkdir -p rosbot3_simulation/src
  cd rosbot3_simulation
  git init
  echo "# rosbot3_simulation
  Workspace ROS contendo três pacotes: ros_commons, rosbot3_description e rosbot3_gazebo." > README.md
  git add README.md
  git commit -m "Commit inicial do workspace"
  git branch -M main
  git remote add origin git@github.com:vitofranzosi/rosbot3_simulation.git
  git push -u origin main
```

## 🧩 5. Adicionar os pacotes como submódulos
```bash
  cd src
  git submodule add git@github.com:vitofranzosi/ros_commons.git ros_commons
  git submodule add git@github.com:vitofranzosi/rosbot3_description.git rosbot3_description
  git submodule add git@github.com:vitofranzosi/rosbot3_gazebo.git rosbot3_gazebo
  cd ..
  git add .gitmodules src/
  git commit -m "Adiciona submódulos dos pacotes ROS"
  git push
```

## 🧩 6. Testar clonagem completa

Agora qualquer pessoa (ou você mesmo, em outro computador) pode clonar tudo assim:
  git clone --recurse-submodules git@github.com:vitofranzosi/rosbot3_simulation.git

## ✅ Resultado final
```bash
a) Nenhuma senha ou token será pedido (tudo via SSH 🔐)
b) Todos os pacotes têm commits e repositórios próprios
c) O workspace rosbot3_simulation agrega os três pacotes como submódulos
d) Estrutura 100% compatível com ROS
```

💡 Dica
Para atualizar todos os submódulos depois de alterações nos pacotes individuais:
```bash
  git submodule update --remote --merge
  git add src/
  git commit -m "Atualiza submódulos"
  git push
```