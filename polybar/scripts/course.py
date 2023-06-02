import yaml

# Read the YAML file
with open('/home/daniel/current_course/info.yaml', 'r') as file:
    data = yaml.safe_load(file)

# Access the value under the 'title' key
title = data['title']

# Print the value
print(title)

