以下是为 FPSO-FS MATLAB 实现准备的 README 文件：

---

# FPSO-FS: Federated Particle Swarm Optimization for Feature Selection

This repository contains the MATLAB implementation of the **Federated Particle Swarm Optimization Feature Selection (FPSO-FS)** algorithm, which is designed for distributed feature selection under privacy-preserving constraints.

## Features
- Implements a federated feature selection approach using Particle Swarm Optimization (PSO).
- Supports multiple participants (B-participants) to collaborate without sharing raw data.
- Includes local and global optimization processes for selecting an optimal feature subset.
- Evaluates the selected features using classification accuracy with a K-Nearest Neighbors (KNN) classifier.
- Provides modular code for easy extension and integration.

---

## Requirements
- **MATLAB R2020a** or later.
- Statistics and Machine Learning Toolbox (for `fitcknn` and `crossval` functions).

---

## Files
### Main Files
1. **`main.m`**  
   Entry point of the program. Sets parameters, loads the dataset, and calls the FPSO-FS algorithm. Outputs the global best feature subset and classification accuracy.

2. **`FPSO_FS.m`**  
   Core implementation of the Federated PSO-based feature selection algorithm.

3. **`localPSO.m`**  
   Handles the local PSO process for each participant to optimize its feature subset.

4. **`splitData.m`**  
   Splits the dataset into multiple subsets for federated participants.

5. **`aggregateResults.m`**  
   Aggregates local results from all participants to determine the global best feature subset.

6. **`evaluateFeatures.m`**  
   Evaluates the classification performance of a selected feature subset using KNN.

7. **`updateVelocity.m` & `updatePosition.m`**  
   Updates particle velocities and positions in the PSO process.

8. **`visualizeResults.m`**  
   Visualizes the selected feature subset and classification accuracy.

---

## Usage
1. **Prepare Dataset**  
   Ensure your dataset is in MATLAB format (`.mat` file) with the following variables:
   - `data`: Feature matrix (\(n \times d\), where \(n\) is the number of samples and \(d\) is the number of features).
   - `labels`: Class labels (\(n \times 1\)).

2. **Run the Main Script**  
   Execute `main.m`:
   ```matlab
   main
   ```

3. **Outputs**  
   - Selected features: Indices of the optimal feature subset.
   - Classification accuracy: Accuracy of the selected features using KNN.
   - Visualizations: Bar chart of selected features and classification accuracy.

---

## Parameters
- **Global Settings**:
  - `numParticipants`: Number of participants in the federated setup.
  - `numParticles`: Number of particles in each participant's PSO swarm.
  - `maxGlobalIter`: Maximum number of global iterations.
  - `maxLocalIter`: Maximum number of local iterations per participant.

- **PSO Hyperparameters**:
  - `w`: Inertia weight (default: `0.5`).
  - `c1`: Cognitive acceleration coefficient (default: `1.5`).
  - `c2`: Social acceleration coefficient (default: `1.5`).

---

## Example
### Dataset Example
For demonstration, consider a dataset `data.mat`:
```matlab
% Load the dataset
load('data.mat');
size(data)   % Output: [150, 20] (150 samples, 20 features)
size(labels) % Output: [150, 1] (150 class labels)
```

### Running the Program
```matlab
>> main
Starting FPSO-FS...
Global Iteration 1/10
Global Best Accuracy: 0.8520
...
Selected Features: [1, 3, 5, 8, 12]
Global Best Classification Accuracy: 0.8842
```

---

## Extensions
1. **Classification Models**:
   Replace `fitcknn` with other classifiers like SVM or Decision Trees.
2. **Custom Metrics**:
   Add metrics like precision, recall, or F1-score in `evaluateFeatures.m`.
3. **Advanced PSO Variants**:
   Implement advanced PSO strategies such as adaptive inertia weight or hybrid PSO.

---

## License
This project is released under the MIT License.

---

If you need additional help or have questions, feel free to ask!