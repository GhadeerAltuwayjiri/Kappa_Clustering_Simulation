import numpy as np
import matplotlib.pyplot as plt

# Assume necessary data and functions are loaded or defined elsewhere

# Kappa values
Kappa_vals = [0.1, 0.25, 0.5, 1, 2, 4, 10]
num_kappa = len(Kappa_vals)

# cov_sim variations
cov_sim_values = [0, 0.1, 0.2, 0.5, 0.7]
num_cov_sim = len(cov_sim_values)

# Assuming num_simulations is constant for all cov_sim variations
num_simulations = 5  

# Initialize a 3D array to store metrics
metrics_array = np.zeros((num_kappa, num_simulations, num_cov_sim))

# Loop over each cov_sim value in simulated_data_lists
for cov_index in range(num_cov_sim):
    cov_sim_name = f"cov_sim_{cov_sim_values[cov_index]}"
    
    # Extract the Zhat and Ztoy lists for the current cov_sim
    Zhat_list1_for_cov_sim = simulated_data_lists[cov_sim_name]['Zhat']
    Ztoy_list1_for_cov_sim = simulated_data_lists[cov_sim_name]['Ztoy']
    
    # Loop over kappa values and simulations/samples
    for i in range(num_kappa):
        for j in range(num_simulations):
            # Calculate Metric 1 for the current cov_sim and simulation
            metric1_numerator = np.sum(np.diag(np.histogram2d(Z_mat5[cov_sim_name][i][j], Ztoy_list1_for_cov_sim[j])[0]))
            metric1_denominator = np.sum(np.histogram2d(Zhat_list1_for_cov_sim[j], Ztoy_list1_for_cov_sim[j])[0])
            
            # Store the metric in the 3D array
            metrics_array[i, j, cov_index] = metric1_numerator / metric1_denominator

# Loop to create all the plots
for cov_sim_value in cov_sim_values:
    selected_cov_sim = f"cov_sim_{cov_sim_value}"
    
    # Extract the KL divergence matrix for the selected cov_sim
    kl_divergence_for_cov_sim = KL_mat2[selected_cov_sim]
    
    # Plotting KL divergence for each kappa value across the 5 simulated samples
    plt.figure()
    for i in range(num_simulations):
        plt.plot(Kappa_vals, kl_divergence_for_cov_sim[i], marker='o', label=f'Sample {i+1}')
    
    plt.xlabel("Kappa")
    plt.ylabel("KL Divergence")
    plt.title(f"KL Divergence for omega = {cov_sim_value}")
    plt.legend()
    plt.show()
