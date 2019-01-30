import os
import sys

import tensorflow as tf
import pandas as pd
from sklearn.preprocessing import MinMaxScaler
from tensorflow.python.tools import freeze_graph

# Turn off TensorFlow warning messages in program output
from tensorflow.python.tools import freeze_graph

os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'
saver_write_version = tf.train.SaverDef.V2

# Load training data set from CSV file
training_data_df = pd.read_csv("tc_training_clean.csv", dtype=float, sep=';')

# Pull out columns for X (data to train with) and Y (value to predict)
#training_data_df.drop('Time', axis=1)
#X_training = training_data_df[['HeelLeft','FrontLeft']].values
X_training = training_data_df.drop(['mistake','Time'], axis=1).values
Y_training = training_data_df[['mistake']].values

# Load testing data set from CSV file
test_data_df = pd.read_csv("tc_test.csv", dtype=float, sep=';')

# Pull out columns for X (data to train with) and Y (value to predict)
#X_testing = test_data_df[['HeelLeft','FrontLeft']].values
X_testing = test_data_df.drop(['mistake','Time'], axis=1).values
Y_testing = test_data_df[['mistake']].values

# All data needs to be scaled to a small range like 0 to 1 for the neural
# network to work well. Create scalers for the inputs and outputs.
#X_scaler = MinMaxScaler(feature_range=(0, 1))
#Y_scaler = MinMaxScaler(feature_range=(0, 1))

# Scale both the training inputs and outputs
X_scaled_training = X_training #X_scaler.fit_transform(X_training)
Y_scaled_training = Y_training #Y_scaler.fit_transform(Y_training)

# It's very important that the training and test data are scaled with the same scaler.
X_scaled_testing = X_testing #X_scaler.transform(X_testing)
Y_scaled_testing = Y_testing #Y_scaler.transform(Y_testing)

# Define model parameters
learning_rate = 0.001
training_epochs = 100

# Define how many inputs and outputs are in our neural network
number_of_inputs = 8
number_of_outputs = 1

# Define how many neurons we want in each layer of our neural network
layer_1_nodes = 50
layer_2_nodes = 300
layer_3_nodes = 300
layer_4_nodes = 50

# Section One: Define the layers of the neural network itself

# Input Layer
with tf.variable_scope('input'):
    X = tf.placeholder(tf.float32, shape=(None, number_of_inputs), name="tc-input")

# Layer 1
with tf.variable_scope('layer_1'):
    weights = tf.get_variable("weights1", shape=[number_of_inputs, layer_1_nodes], initializer=tf.contrib.layers.xavier_initializer())
    biases = tf.get_variable(name="biases1", shape=[layer_1_nodes], initializer=tf.zeros_initializer())
    layer_1_output = tf.nn.sigmoid(tf.matmul(X, weights) + biases)

# Layer 2
with tf.variable_scope('layer_2'):
    weights = tf.get_variable("weights2", shape=[layer_1_nodes, layer_2_nodes], initializer=tf.contrib.layers.xavier_initializer())
    biases = tf.get_variable(name="biases2", shape=[layer_2_nodes], initializer=tf.zeros_initializer())
    layer_2_output = tf.nn.sigmoid(tf.matmul(layer_1_output, weights) + biases)

# Layer 3
with tf.variable_scope('layer_3'):
    weights = tf.get_variable("weights3", shape=[layer_2_nodes, layer_3_nodes], initializer=tf.contrib.layers.xavier_initializer())
    biases = tf.get_variable(name="biases3", shape=[layer_3_nodes], initializer=tf.zeros_initializer())
    layer_3_output = tf.nn.sigmoid(tf.matmul(layer_2_output, weights) + biases)

# Layer 4
with tf.variable_scope('layer_4'):
    weights = tf.get_variable("weights4", shape=[layer_3_nodes, layer_4_nodes],
                              initializer=tf.contrib.layers.xavier_initializer())
    biases = tf.get_variable(name="biases4", shape=[layer_4_nodes], initializer=tf.zeros_initializer())
    layer_4_output = tf.nn.sigmoid(tf.matmul(layer_3_output, weights) + biases)

# Output Layer
with tf.variable_scope('output'):
    weights = tf.get_variable("weights5", shape=[layer_4_nodes, number_of_outputs], initializer=tf.contrib.layers.xavier_initializer())
    biases = tf.get_variable(name="biases5", shape=[number_of_outputs], initializer=tf.zeros_initializer())
    prediction = (tf.matmul(layer_4_output, weights) + biases)

# Section Two: Define the cost function of the neural network that will measure prediction accuracy during training

with tf.variable_scope('cost'):
    Y = tf.placeholder(tf.float32, shape=(None, 1), name="output_node")
    cost = tf.reduce_mean(tf.squared_difference(prediction, Y))

# Section Three: Define the optimizer function that will be run to optimize the neural network

with tf.variable_scope('train'):
    optimizer = tf.train.AdamOptimizer(learning_rate).minimize(cost)

with tf.variable_scope('logging'):
    tf.summary.scalar('current cost', cost)
    summary = tf.summary.merge_all()

saver = tf.train.Saver()

# Initialize a session so that we can run TensorFlow operations
with tf.Session() as session:

    # Run the global variable initializer to initialize all variables and layers of the neural network
    session.run(tf.global_variables_initializer())

    # Run the optimizer over and over to train the network.
    # One epoch is one full run through the training data set.
    for epoch in range(training_epochs):

        # Feed in the training data and do one step of neural network training
        session.run(optimizer, feed_dict={X: X_scaled_training, Y: Y_scaled_training})

        # logging
        training_writer = tf.summary.FileWriter("log1/training", session.graph)
        testing_writer = tf.summary.FileWriter("log1/testing", session.graph)

        # Every 5 training steps, log our progress
        if epoch % 5 == 0:
            training_cost, training_summary = session.run([cost, summary], feed_dict={X: X_scaled_training, Y:Y_scaled_training})
            testing_cost, testing_summary = session.run([cost, summary], feed_dict={X: X_scaled_testing, Y:Y_scaled_testing})

            training_writer.add_summary(training_summary, epoch)
            testing_writer.add_summary(testing_summary, epoch)

            print(epoch, training_cost, testing_cost)

    # Training is now complete!
    print("Training is complete!")

    final_training_cost = session.run(cost, feed_dict={X: X_scaled_training, Y: Y_scaled_training})
    final_testing_cost = session.run(cost, feed_dict={X: X_scaled_testing, Y: Y_scaled_testing})

    print("Final Training cost: {}".format(final_training_cost))
    print("Final Testing cost: {}".format(final_testing_cost))

    # Now that the neural network is trained, let's use it to make predictions for our test data.
    # Pass in the X testing data and run the "prediciton" operation
    Y_predicted_scaled = session.run(prediction, feed_dict={X: X_scaled_testing})

    # Unscale the data back to it's original units (dollars)
    Y_predicted = Y_predicted_scaled

    real_earnings = test_data_df['mistake'].values[0]
    predicted_earnings = Y_predicted[0][0]

    acc = 0

    for i in range(230) :
        acc += Y_predicted[i][0]

    print("acc1 = {}".format(acc/230))

    acc = 0

    for i in range(200) :
        acc += Y_predicted[i + 260][0]

    print("acc0 = ${}".format(acc/200))

    print("The actual earnings of Game #1 were ${}".format(real_earnings))
    print("Our neural network predicted earnings of ${}".format(predicted_earnings))

    # export model

    # model_builder = tf.saved_model.builder.SavedModelBuilder("exported_model")
    #
    # inputs = {
    #     'input': tf.saved_model.utils.build_tensor_info(X)
    # }
    # outputs = {
    #     'mistake': tf.saved_model.utils.build_tensor_info(prediction)
    # }
    #
    # signature_def = tf.saved_model.signature_def_utils.build_signature_def(
    #     inputs=inputs,
    #     outputs=outputs,
    #     method_name=tf.saved_model.signature_constants.PREDICT_METHOD_NAME
    # )
    #
    # model_builder.add_meta_graph_and_variables(
    #     session,
    #     tags=[tf.saved_model.tag_constants.SERVING],
    #     signature_def_map={
    #         tf.saved_model.signature_constants.DEFAULT_SERVING_SIGNATURE_DEF_KEY: signature_def
    #     }
    # )
    #
    # model_builder.save()
    #
    # checkpoint_path = saver.save(session, "logs/trained_model.ckpt")
    # print("Model saved: {}".format(checkpoint_path))

    saver = tf.train.Saver()
    saver.save(session, './tensorflowModel.ckpt')
    tf.train.write_graph(session.graph.as_graph_def(), '.', 'tensorflowModel.pbtxt', as_text=True)


    freeze_graph.freeze_graph('tensorflowModel.pbtxt',
                              "",
                              False,
                              './tensorflowModel.ckpt',
                              "output/add",
                               "save/restore_all",
                              "save/Const:0",
                               'frozentensorflowModel.pb',
                              True,
                              ""
                             )
    #[print(n.name) for n in tf.get_default_graph().as_graph_def().node]