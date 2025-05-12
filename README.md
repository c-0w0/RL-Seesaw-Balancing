# RL-Seesaw-Balancing

This is a project to showcase reinforcement learning implementation in Godot. The neural network framework used can be found at [here](https://github.com/edbeeching/godot_rl_agents.git).

To run the project for the forst time, follow the steps below. 

1. Create a folder to hold the project files. 
> mkdir Project
> cd Project
2. Move the stable_baselines3_example.py file into this folder.
3. Clone the project into the folder. 
> git clone https://github.com/c-0w0/RL-Seesaw-Balancing.git
4. Create a python virtual environment to hold the neural network.
> python -m venv AISquares
5. Activate the virtual environment and install the framework.
> AISquares\Scripts\activate
> pip install godot-rl
6. Execute the neural network framework.
> python stable_baselines3_example.py
7. Run the godot application by using the play button on the top right.
8. Watch as the neural network tries to balance on the seat. 

To run the project for the next time, follow the steps below.

1. Activate the virtual environment.
> cd Project
> AISquares\Scripts\activate
2. Execute the neural network framework.
> python stable_baselines3_example.py
3. Run the godot application by using the play button on the top right.
