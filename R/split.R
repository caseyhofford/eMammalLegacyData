#Specify CSVs
project = read.csv("project.csv")#column Project.ID was preceded by ï.. which is the Byte Order Mark being misinterpreted, so the BOM is specified here
deployment = read.csv("deployment.csv")
#sequence = read.csv("sequence.csv")
image = read.csv("images.csv")

#Create output folder
dir.create("output")

#Get the list of unique values

for (name in levels(deployment$Camera.Deployment.ID)){
  #Create deployment dir
  folder = paste("output/", name , sep = "")
  dir.create(folder)
  
  #Subset the data by field
  dep = subset(deployment, Camera.Deployment.ID==name)
  #seq = subset(sequence, Deployment.ID==name)
  img = subset(image, Deployment.ID==name)
  
  #Build paths
  fn1 = paste("output/", name, "/Project.csv" , sep = "")
  fn2 = paste("output/", name, "/Deployment.csv" , sep = "")
  #fn3 = paste("output/", name, "/Sequence.csv" , sep = "")
  fn4 = paste("output/", name, "/Image.csv" , sep = "")
  
  # Get minimum Image.Sequence.ID and take one off to find subtract value
  #subtractvalue = min(seq$Image.Sequence.ID) - 1
  #if (subtractvalue == Inf){ print( name ) }
  
  #Subtract value from column Image.Sequence.ID to start with 1
  #seq$Image.Sequence.ID = seq$Image.Sequence.ID - subtractvalue
  #img$Image.Sequence.ID = img$Image.Sequence.ID - subtractvalue
    
  #Save the CSV files
  write.csv(project, fn1, row.names=FALSE, quote=TRUE, na="")
  write.csv(dep, fn2, row.names=FALSE, quote=TRUE, na="")
  #write.csv(seq, fn3, row.names=FALSE, quote=FALSE, na="")
  write.csv(img, fn4, row.names=FALSE, quote=TRUE, na="")
}
message ("Completed Succesfully!")