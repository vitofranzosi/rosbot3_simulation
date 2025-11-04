# rosbot3_simulation

🧠 Passo a passo par criação do projeto
---------------------------------------

🆕 Etapa 1 — Criar os novos repositórios no GitHub
--------------------------------------------------
A) Criar o ros3_simulation
-----------------------------
1.1) Clique no botão "New Repository"

1.2) Nome: ros3_simulation

1.3) Escolha "Public" ou "Private", conforme desejar

1.4) Desmarque a opção “Add a README file” (vamos criar o nosso)

1.5) Clique em “Create Repository”

B) Criar o ros3_commons
--------------------------
1.1) Clique no botão "New Repository"

1.2) Nome: ros3_commons

1.3) Escolha "Public" ou "Private", conforme desejar

1.4) Desmarque a opção “Add a README file” (vamos criar o nosso)

1.5) Clique em “Create Repository”

C) Criar o ros3_description
------------------------------
1.1) Clique no botão "New Repository"

1.2) Nome: ros3_description

1.3) Escolha "Public" ou "Private", conforme desejar

1.4) Desmarque a opção “Add a README file” (vamos criar o nosso)

1.5) Clique em “Create Repository”

D) Criar o ros3_gazebo
-------------------------
1.1) Clique no botão "New Repository"

1.2) Nome: ros3_gazebo

1.3) Escolha "Public" ou "Private", conforme desejar

1.4) Desmarque a opção “Add a README file” (vamos criar o nosso)

1.5) Clique em “Create Repository”


💻 Etapa 2 — Clonar o ros3_simulation repositório
----------------------------------------------------
2.1) cd ROS2MAR/docker/docker_description

2.2) git clone git@github.com:SEU_USUARIO/ros3_simulation.git


📁 Etapa 3 — Adicionar a estrutura de diretórios
------------------------------------------------
3.1) cd ros3_simulation

3.2) mkdir -p src

3.3) touch README.md


🔗 Etapa 4 — Adicionar submódulos corretamente
----------------------------------------------
4.1) Inicialize o repositório com um primeiro commit

Execute estes comandos no seu terminal (fora do projeto principal):

cd ~
mkdir ros3_commons
cd ros3_commons
git init -b main
echo "# ROS3 Commons" > README.md
git add README.md
git commit -m "Inicializa repositório ros3_commons"
git remote add origin git@github.com:vitofranzosi/ros3_commons.git
git push -u origin main


4.1) git submodule add git@github.com:SEU_USUARIO/ros3_commons.git src/ros3_commons

4.2) git submodule add git@github.com:SEU_USUARIO/ros3_description.git src/ros3_description

4.3) git submodule add git@github.com:SEU_USUARIO/ros3_gazebo.git src/ros3_gazebo

OBS: 💡 Cada um desses deve ser também um repositório Git separado no seu GitHub.

4.4) Verifique o arquivo .gitmodules: cat .gitmodules

Deve aparecer algo assim:

[submodule "src/ros3_commons"]

    path = src/ros3_commons

    url = git@github.com:SEU_USUARIO/ros3_commons.git

[submodule "src/ros3_description"]

    path = src/ros3_description

    url = git@github.com:SEU_USUARIO/ros3_description.git

[submodule "src/ros3_gazebo"]

    path = src/ros3_gazebo

    url = git@github.com:SEU_USUARIO/ros3_gazebo.git


🚨 Etapa 5 - Se o arquivo não existir ou o caminho estiver incorreto, você pode recriar o submódulo
---------------------------------------------------------------------------------------------------
5.1) Inicialize e atualize o submódulo corretamente

Execute na raiz do projeto (ros3_simulation/): git submodule update --init --recursive

Esse comando vai clonar o conteúdo do submódulo e fazer checkout do commit correto.

5.2) Se ele já existir, mas estiver inconsistente, você pode forçar a atualização: git submodule update --init --recursive --force

5.3) Verifique se o conteúdo foi baixado

5.3.1) Entre na pasta do submódulo:

cd src/ros3_commons

git status

Você deve ver algo como:

On branch main
Your branch is up to date with 'origin/main'.
nothing to commit, working tree clean
Se aparecer “no branch” ou “HEAD detached”, é normal — significa que o submódulo está apontando para um commit específico.

5.4) Volte à raiz e adicione novamente


🚀 Etapa 6 — Adicionar e enviar tudo ao GitHub
----------------------------------------------
6.1) git add .

6.2) git commit -m "Inicia projeto ROSBot3 com submódulos"

6.3) git push -u origin main


🔁 Etapa 7 — Clonar e atualizar submódulos no futuro
----------------------------------------------------
7.1) Sempre que alguém clonar este projeto, use:

7.1.1) git clone git@github.com:SEU_USUARIO/rosbot3_simulation.git

7.1.2) cd rosbot3_simulation

7.1.3) git submodule update --init --recursive

7.2) 💡 Dica: Atualizar todos os submódulos depois

7.2.1) Se quiser atualizar tudo (repositório principal e submódulos):

7.2.1.1) git pull --recurse-submodules

7.2.1.2) git submodule update --remote --merge


✅ Etapa 8 - Estrutura final esperada
-------------------------------------
rosbot3_simulation/

├── src/

│   ├── rosbot3_commons/           (submódulo)

│   ├── rosbot3_description/   (submódulo)

│   └── rosbot3_gazebo/        (submódulo)

└── README.md


🧱 Etapa 9 - Estrutura final dos subdiretórios
----------------------------------------------

rosbot3_simulation/

└── src/

    ├── rosbot3_commons/

    │   ├── package.xml

    │   ├── CMakeLists.txt

    │   └── launch/

    │       └── robot_state_publisher.launch.py
    │

    ├── rosbot3_description/

    │   ├── package.xml

    │   ├── CMakeLists.txt

    │   ├── urdf/

    │   │   ├── rosbot3_base.xacro

    │   │   └── rosbot3.urdf.xacro

    │   └── meshes/

    │       └── (arquivos .stl ou .dae se desejar)
    │

    └── rosbot3_gazebo/

        ├── package.xml

        ├── CMakeLists.txt

        ├── launch/

        │   └── simulation.launch.py

        └── worlds/

            └── empty.world
