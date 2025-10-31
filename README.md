# rosbot3_simulation

🧠 Passo a passo par criação do projeto
---------------------------------------

🆕 Etapa 1 — Criar os novos repositórios no GitHub
--------------------------------------------------
A) Criar o rosbot3_simulation
-----------------------------
1.1) Clique no botão "New Repository"
1.2) Nome: rosbot3_simulation
1.3) Escolha "Public" ou "Private", conforme desejar
1.4) Desmarque a opção “Add a README file” (vamos criar o nosso)
1.5) Clique em “Create Repository”

B) Criar o ros_commons
----------------------
1.1) Clique no botão "New Repository"
1.2) Nome: rosbot3_commons
1.3) Escolha "Public" ou "Private", conforme desejar
1.4) Desmarque a opção “Add a README file” (vamos criar o nosso)
1.5) Clique em “Create Repository”

C) Criar o rosbot3_description
------------------------------
1.1) Clique no botão "New Repository"
1.2) Nome: rosbot3_description
1.3) Escolha "Public" ou "Private", conforme desejar
1.4) Desmarque a opção “Add a README file” (vamos criar o nosso)
1.5) Clique em “Create Repository”

D) Criar o rosbot3_gazebo
-------------------------
1.1) Clique no botão "New Repository"
1.2) Nome: rosbot3_gazebo
1.3) Escolha "Public" ou "Private", conforme desejar
1.4) Desmarque a opção “Add a README file” (vamos criar o nosso)
1.5) Clique em “Create Repository”


💻 Etapa 2 — Clonar o rosbot3_simulation repositório
----------------------------------------------------
2.1) cd ROS2MAR/docker/docker_description
2.2) git clone git@github.com:SEU_USUARIO/rosbot3_simulation.git


📁 Etapa 3 — Adicionar a estrutura de diretórios
------------------------------------------------
3.1) cd rosbot3_simulation
3.2) mkdir -p src
3.3) touch README.md


🔗 Etapa 4 — Adicionar submódulos corretamente
----------------------------------------------
4.1) git submodule add git@github.com:SEU_USUARIO/ros_commons.git src/ros_commons
4.2) git submodule add git@github.com:SEU_USUARIO/rosbot3_description.git src/rosbot3_description
4.3) git submodule add git@github.com:SEU_USUARIO/rosbot3_gazebo.git src/rosbot3_gazebo
OBS: 💡 Cada um desses deve ser também um repositório Git separado no seu GitHub.
4.4) Verifique o arquivo .gitmodules: cat .gitmodules
Deve aparecer algo assim:
[submodule "src/ros_commons"]
    path = src/ros_commons
    url = git@github.com:SEU_USUARIO/ros_commons.git
[submodule "src/rosbot3_description"]
    path = src/rosbot3_description
    url = git@github.com:SEU_USUARIO/rosbot3_description.git
[submodule "src/rosbot3_gazebo"]
    path = src/rosbot3_gazebo
    url = git@github.com:SEU_USUARIO/rosbot3_gazebo.git


🚀 Etapa 5 — Adicionar e enviar tudo ao GitHub
----------------------------------------------
5.1) git add .
5.2) git commit -m "Inicia projeto ROSBot3 com submódulos"
5.3) git push -u origin main


🔁 Etapa 6 — Clonar e atualizar submódulos no futuro
----------------------------------------------------
6.1) Sempre que alguém clonar este projeto, use:
6.1.1) git clone git@github.com:SEU_USUARIO/rosbot3_simulation.git
6.1.2) cd rosbot3_simulation
6.1.3) git submodule update --init --recursive
6.2) 💡 Dica: Atualizar todos os submódulos depois
6.2.1) Se quiser atualizar tudo (repositório principal e submódulos):
6.2.1.1) git pull --recurse-submodules
6.2.1.2) git submodule update --remote --merge


✅ Etapa 7 - Estrutura final esperada
-------------------------------------
rosbot3_simulation/

├── src/

│   ├── ros_commons/           (submódulo)

│   ├── rosbot3_description/   (submódulo)

│   └── rosbot3_gazebo/        (submódulo)

└── README.md
