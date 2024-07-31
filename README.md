# Kappa Clustering Simulation

This project performs data simulations and clustering analysis using various kappa values and covariance simulations (`cov_sim`). It generates metrics and plots to evaluate the clustering performance.

## Usage

### Requirements

#### R
Ensure you have the following packages installed in R:
- `MASS`
- `flowClust`
- `latex2exp`
- Any other dependent packages (e.g., `flowCore`)

#### Python
Ensure you have the following packages installed in Python:
- `numpy`
- `scikit-learn`
- `matplotlib`

### How to Run

#### R

To run the R code, open the `R/kappa_clustering_simulation.R` file in your R environment and source it.

#### Python

To run the Python code, open the `Python/kappa_clustering_simulation.py` file and execute it in your Python environment.

### Code Explanation

#### R Code

The R script `kappa_clustering_simulation.R` initializes arrays to store metrics for various kappa values and `cov_sim` variations. It then loops over these values to compute and store metrics such as KL divergence and Z values. The script also generates plots to visualize the results.

#### Python Code

The Python script `kappa_clustering_simulation.py` (to be created similarly to the R script) will follow a similar process. It initializes arrays to store metrics for various kappa values and `cov_sim` variations. It then loops over these values to compute and store metrics and generate plots to visualize the results.

## Contribution

We welcome contributions to improve the project. Please open issues or submit pull requests on GitHub.

## License

This project is part of a student project at Trinity College Dublin. For more details, see the `LICENSE` file.
