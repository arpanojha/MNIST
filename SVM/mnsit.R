# Classification template

# Importing the dataset
dataset = read.csv('mnsit.csv')


# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$label, SplitRatio = 0.9)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
#training_set[-1] = scale(training_set[-1])
#test_set[-1] = scale(test_set[-1])

library(e1071)
classifier = svm(formula = label ~.,
                 data= training_set,
                 type = 'C-classification',
                 kernel = 'polynomial')

y_prec = predict(classifier, newdata = test_set[-1])

cm = table(test_set[,1],y_prec)
cm

actual_test = dataset = read.csv('mnsit_test.csv')
y_pred1 = predict(classifier, newdata = actual_test)
y_pred1

cm1 = table(test_set[,1],y_pred1)
cm1

write.csv(y_pred1,'submiss.csv')
