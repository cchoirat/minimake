sample: simulate_data.R
	R CMD BATCH simulate_data.R

plot: sample_data.csv create_graph.py
	python create_graph.py

estimate: sample_data.csv estimate_model.R
	R CMD BATCH estimate_model.R
