library(MASS)
library(flowClust)
library(latex2exp)
# Assume necessary data and functions are loaded or defined elsewhere

# Kappa values
Kappa_vals <- c(0.1, 0.25, 0.5, 1, 2, 4, 10)
num_kappa <- length(Kappa_vals)

# cov_sim variations
cov_sim_values <- c(0, 0.1, 0.2, 0.5, 0.7)
num_cov_sim <- length(cov_sim_values)

# Assuming num_simulations is constant for all cov_sim variations
num_simulations <- 5  

# Initialize a 3D array to store metrics
metrics_array <- array(dim = c(num_kappa, num_simulations, num_cov_sim))

# Names for the 3rd dimension (cov_sim values)
dimnames(metrics_array) <- list(kappa = Kappa_vals, simulation = 1:num_simulations, cov_sim = cov_sim_values)

# Loop over each cov_sim value in simulated_data_lists
for (cov_index in 1:num_cov_sim) {
  cov_sim_name <- paste("cov_sim", cov_sim_values[cov_index], sep = "_")
  
  # Extract the Zhat and Ztoy lists for the current cov_sim
  Zhat_list1_for_cov_sim <- simulated_data_lists[[cov_sim_name]]$Zhat
  Ztoy_list1_for_cov_sim <- simulated_data_lists[[cov_sim_name]]$Ztoy
  
  # Loop over kappa values and simulations/samples
  for (i in 1:num_kappa) {
    for (j in 1:num_simulations) {
      # Calculate Metric 1 for the current cov_sim and simulation
      metric1_numerator <- sum(diag(table(Z_mat5[[cov_sim_name]][[i]][[j]], Ztoy_list1_for_cov_sim[[j]])))
      metric1_denominator <- sum(table(Zhat_list1_for_cov_sim[[j]], Ztoy_list1_for_cov_sim[[j]]))
      
      # Store the metric in the 3D array
      metrics_array[i, j, cov_index] <- metric1_numerator / metric1_denominator
    }
  }
}

# Define the layout matrix for plotting
layout_matrix <- matrix(c(1, 2, 
                          3, 5, 
                          4, 4), nrow = 3, byrow = TRUE)

# Set up the layout
layout(layout_matrix, heights = c(1, 2, 1))

# Loop to create all the plots
for (i in 1:length(cov_sim_values)) {
  cov_sim_value <- cov_sim_values[i]
  selected_cov_sim <- paste("cov_sim", cov_sim_value, sep = "_")
  
  # Extract the KL divergence matrix for the selected cov_sim
  kl_divergence_for_cov_sim <- KL_mat2[[selected_cov_sim]]
  
  # Plotting KL divergence for each kappa value across the 5 simulated samples
  plot(kappa_vals, kl_divergence_for_cov_sim[1,], type = "b", col = "red", 
       xlab = "Kappa", ylab = "KL Divergence", 
       main = TeX(paste("KL Divergence for $\\omega = ", cov_sim_value)), 
       cex.main = 2,  # Adjust the size of the main title text
       ylim = range(kl_divergence_for_cov_sim))
  
  # Adding lines for other samples
  for (j in 2:nrow(kl_divergence_for_cov_sim)) {
    lines(kappa_vals, kl_divergence_for_cov_sim[j,], type = "b", col = j)
  }
  
  # Adding a legend
  legend("topright", legend = paste("Sample", 1:nrow(kl_divergence_for_cov_sim)), col = 1:nrow(kl_divergence_for_cov_sim), lty = 1, pch = 1)
}
