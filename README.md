# RL Seesaw Balancing
This is a project to showcase reinforcement learning implementation in Godot. The neural network framework used can be found [here](https://github.com/edbeeching/godot_rl_agents.git).

![image](https://github.com/user-attachments/assets/0a0f1ee0-31eb-42cd-b4aa-49de317c77fb)
![image](https://github.com/user-attachments/assets/03ac92ce-f43c-4446-bf82-cde04bdda918)

# Usage
## To run the project for the first time: 
1. Create a folder to hold the project files.
   ```
   mkdir Project
   ```
   ```
   cd Project
   ```
2. Clone the project into the folder.
   ```
   git clone https://github.com/c-0w0/RL-Seesaw-Balancing.git
   ```
3. Move `stable_baselines3_example.py` to the parent folder **Project**.
4. Create a python virtual environment to hold the neural network at the parent folder **Project**.
   ```
   python -m venv AISquares
   ```
   ![image](https://github.com/user-attachments/assets/e9467268-401d-4c5e-96e8-4baf1cc09e52)

5. Activate the virtual environment and install the framework.
   ```
   AISquares\Scripts\activate
   ```
   ```
   pip install godot-rl
   ```
6. Execute the neural network framework.
   ```
   python stable_baselines3_example.py
   ```
7. Run the game in Godot.
8. Watch as the neural network tries to balance on the seat. 

## To run the project for after the first time:
1. Activate the virtual environment.
   ```
   cd Project
   ```
   ```
   AISquares\Scripts\activate
   ```
2. Execute the neural network framework.
   ```
   python stable_baselines3_example.py
   ```
3. Run the game in Godot.
