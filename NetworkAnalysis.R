# Simple example data (matrix format)
# Consider a dataset with 5 features for 10 samples
set.seed(123)


data_matrix <- matrix(rnorm(50), ncol = 5)

# Preprocessing: Normalize the data (z-score standardization)
normalized_data <- scale(data_matrix)

# Compute pair-wise correlation matrix
correlation_matrix <- cor(normalized_data)

# Set a threshold for constructing the graph
threshold <- 0.5  # Define a threshold value (you can adjust this as needed)

# Construct an adjacency matrix based on the threshold
adjacency_matrix <- ifelse(abs(correlation_matrix)> threshold, 1, 0)

# Set diagonal values to zero
diag(adjacency_matrix) <- 0

# Convert the adjacency matrix to a graph object
library(igraph)
graph_object <- graph.adjacency(adjacency_matrix, mode = "undirected")

plot(graph_object)

# Find communities using Louvain algorithm
communities <- cluster_louvain(graph_object)
plot(graph_object,vertex.color = membership(communities))

)

# Preprocessing: Calculate node degrees (not correlation for a network, but for illustration)
node_degrees <- degree(karate)

# Calculate pair-wise correlation matrix (this step doesn't directly apply to network data)
correlation_matrix <- cor(node_degrees)

# Set a threshold for constructing the graph
threshold <- 5  # Define a threshold value (you can adjust this as needed)

# Construct an adjacency matrix based on the threshold
adjacency_matrix <- ifelse(correlation_matrix > threshold, 1, 0)

# Convert the adjacency matrix to a graph object
graph_object <- graph.adjacency(adjacency_matrix, mode = "undirected")

# Find communities using Louvain algorithm
communities <- cluster_louvain(graph_object)

# Get the membership vector indicating which community each node belongs to
membership_vector <- membership(communities)

# Print the membership vector
print(membership_vector)




# Create Zachary's Karate Club network manually
edges <- c(
  1, 2, 2, 3, 3, 4, 4, 5, 5, 1, 
  6, 1, 7, 1, 8, 1, 9, 1, 11, 1,
  12, 1, 13, 1, 14, 1, 18, 1, 20, 1,
  22, 1, 32, 25, 26, 25, 28, 25, 29, 32,
  3, 9, 3, 10, 3, 28, 28, 27, 2, 31
)

# Define the edges as pairs for creating the graph
edges <- matrix(edges, ncol = 2, byrow = TRUE)

# Create the graph object
library(igraph)
graph_object <- graph_from_edgelist(edges, directed = FALSE)

# Compute pair-wise similarity matrix (example with simple network measures)
# Here, we're using a simple measure, such as the Jaccard similarity coefficient
# to demonstrate pair-wise similarity instead of actual correlations
similarity_matrix <- similarity(graph_object, method = "jaccard")

# Set a threshold for constructing the graph
threshold <- 0.1  # Define a threshold value (you can adjust this as needed)

# Construct an adjacency matrix based on the threshold
adjacency_matrix <- ifelse(similarity_matrix > threshold, 1, 0)

# Convert the adjacency matrix to a graph object
graph_object <- graph.adjacency(adjacency_matrix, mode = "undirected")

# Find communities using Louvain algorithm
communities <- cluster_louvain(graph_object)

# Get the membership vector indicating which community each node belongs to
membership_vector <- communities$membership

# Print the membership vector
print(membership_vector)
plot(graph_object)

