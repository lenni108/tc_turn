��
��
:
Add
x"T
y"T
z"T"
Ttype:
2	
�
	ApplyAdam
var"T�	
m"T�	
v"T�
beta1_power"T
beta2_power"T
lr"T

beta1"T

beta2"T
epsilon"T	
grad"T
out"T�" 
Ttype:
2	"
use_lockingbool( "
use_nesterovbool( 
x
Assign
ref"T�

value"T

output_ref"T�"	
Ttype"
validate_shapebool("
use_lockingbool(�
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
8
Const
output"dtype"
valuetensor"
dtypetype
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
?
FloorDiv
x"T
y"T
z"T"
Ttype:
2	
.
Identity

input"T
output"T"	
Ttype
p
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
	2
;
Maximum
x"T
y"T
z"T"
Ttype:

2	�
�
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(�
=
Mul
x"T
y"T
z"T"
Ttype:
2	�
.
Neg
x"T
y"T"
Ttype:

2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
�
Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	�
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
=
SigmoidGrad
y"T
dy"T
z"T"
Ttype:

2
G
SquaredDifference
x"T
y"T
z"T"
Ttype:

2	�
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	
�
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
s

VariableV2
ref"dtype�"
shapeshape"
dtypetype"
	containerstring "
shared_namestring �"serve*1.12.02v1.12.0-rc2-3-ga6d8ffae09��
t
input/PlaceholderPlaceholder*
dtype0*'
_output_shapes
:���������*
shape:���������
�
1layer_1/weights1/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*#
_class
loc:@layer_1/weights1*
valueB"   2   
�
/layer_1/weights1/Initializer/random_uniform/minConst*
_output_shapes
: *#
_class
loc:@layer_1/weights1*
valueB
 *.���*
dtype0
�
/layer_1/weights1/Initializer/random_uniform/maxConst*
_output_shapes
: *#
_class
loc:@layer_1/weights1*
valueB
 *.��>*
dtype0
�
9layer_1/weights1/Initializer/random_uniform/RandomUniformRandomUniform1layer_1/weights1/Initializer/random_uniform/shape*
dtype0*
_output_shapes

:2*

seed *
T0*#
_class
loc:@layer_1/weights1*
seed2 
�
/layer_1/weights1/Initializer/random_uniform/subSub/layer_1/weights1/Initializer/random_uniform/max/layer_1/weights1/Initializer/random_uniform/min*
_output_shapes
: *
T0*#
_class
loc:@layer_1/weights1
�
/layer_1/weights1/Initializer/random_uniform/mulMul9layer_1/weights1/Initializer/random_uniform/RandomUniform/layer_1/weights1/Initializer/random_uniform/sub*
_output_shapes

:2*
T0*#
_class
loc:@layer_1/weights1
�
+layer_1/weights1/Initializer/random_uniformAdd/layer_1/weights1/Initializer/random_uniform/mul/layer_1/weights1/Initializer/random_uniform/min*#
_class
loc:@layer_1/weights1*
_output_shapes

:2*
T0
�
layer_1/weights1
VariableV2*
dtype0*
_output_shapes

:2*
shared_name *#
_class
loc:@layer_1/weights1*
	container *
shape
:2
�
layer_1/weights1/AssignAssignlayer_1/weights1+layer_1/weights1/Initializer/random_uniform*
use_locking(*
T0*#
_class
loc:@layer_1/weights1*
validate_shape(*
_output_shapes

:2
�
layer_1/weights1/readIdentitylayer_1/weights1*
_output_shapes

:2*
T0*#
_class
loc:@layer_1/weights1
�
!layer_1/biases1/Initializer/zerosConst*"
_class
loc:@layer_1/biases1*
valueB2*    *
dtype0*
_output_shapes
:2
�
layer_1/biases1
VariableV2*
shared_name *"
_class
loc:@layer_1/biases1*
	container *
shape:2*
dtype0*
_output_shapes
:2
�
layer_1/biases1/AssignAssignlayer_1/biases1!layer_1/biases1/Initializer/zeros*
_output_shapes
:2*
use_locking(*
T0*"
_class
loc:@layer_1/biases1*
validate_shape(
z
layer_1/biases1/readIdentitylayer_1/biases1*
T0*"
_class
loc:@layer_1/biases1*
_output_shapes
:2
�
layer_1/MatMulMatMulinput/Placeholderlayer_1/weights1/read*
transpose_b( *
T0*'
_output_shapes
:���������2*
transpose_a( 
j
layer_1/addAddlayer_1/MatMullayer_1/biases1/read*
T0*'
_output_shapes
:���������2
Y
layer_1/SigmoidSigmoidlayer_1/add*
T0*'
_output_shapes
:���������2
�
1layer_2/weights2/Initializer/random_uniform/shapeConst*#
_class
loc:@layer_2/weights2*
valueB"2   ,  *
dtype0*
_output_shapes
:
�
/layer_2/weights2/Initializer/random_uniform/minConst*#
_class
loc:@layer_2/weights2*
valueB
 *��*
dtype0*
_output_shapes
: 
�
/layer_2/weights2/Initializer/random_uniform/maxConst*#
_class
loc:@layer_2/weights2*
valueB
 *�>*
dtype0*
_output_shapes
: 
�
9layer_2/weights2/Initializer/random_uniform/RandomUniformRandomUniform1layer_2/weights2/Initializer/random_uniform/shape*
T0*#
_class
loc:@layer_2/weights2*
seed2 *
dtype0*
_output_shapes
:	2�*

seed 
�
/layer_2/weights2/Initializer/random_uniform/subSub/layer_2/weights2/Initializer/random_uniform/max/layer_2/weights2/Initializer/random_uniform/min*
T0*#
_class
loc:@layer_2/weights2*
_output_shapes
: 
�
/layer_2/weights2/Initializer/random_uniform/mulMul9layer_2/weights2/Initializer/random_uniform/RandomUniform/layer_2/weights2/Initializer/random_uniform/sub*
T0*#
_class
loc:@layer_2/weights2*
_output_shapes
:	2�
�
+layer_2/weights2/Initializer/random_uniformAdd/layer_2/weights2/Initializer/random_uniform/mul/layer_2/weights2/Initializer/random_uniform/min*
_output_shapes
:	2�*
T0*#
_class
loc:@layer_2/weights2
�
layer_2/weights2
VariableV2*#
_class
loc:@layer_2/weights2*
	container *
shape:	2�*
dtype0*
_output_shapes
:	2�*
shared_name 
�
layer_2/weights2/AssignAssignlayer_2/weights2+layer_2/weights2/Initializer/random_uniform*
T0*#
_class
loc:@layer_2/weights2*
validate_shape(*
_output_shapes
:	2�*
use_locking(
�
layer_2/weights2/readIdentitylayer_2/weights2*
_output_shapes
:	2�*
T0*#
_class
loc:@layer_2/weights2
�
!layer_2/biases2/Initializer/zerosConst*"
_class
loc:@layer_2/biases2*
valueB�*    *
dtype0*
_output_shapes	
:�
�
layer_2/biases2
VariableV2*
_output_shapes	
:�*
shared_name *"
_class
loc:@layer_2/biases2*
	container *
shape:�*
dtype0
�
layer_2/biases2/AssignAssignlayer_2/biases2!layer_2/biases2/Initializer/zeros*
use_locking(*
T0*"
_class
loc:@layer_2/biases2*
validate_shape(*
_output_shapes	
:�
{
layer_2/biases2/readIdentitylayer_2/biases2*
T0*"
_class
loc:@layer_2/biases2*
_output_shapes	
:�
�
layer_2/MatMulMatMullayer_1/Sigmoidlayer_2/weights2/read*
T0*(
_output_shapes
:����������*
transpose_a( *
transpose_b( 
k
layer_2/addAddlayer_2/MatMullayer_2/biases2/read*
T0*(
_output_shapes
:����������
Z
layer_2/SigmoidSigmoidlayer_2/add*(
_output_shapes
:����������*
T0
�
1layer_3/weights3/Initializer/random_uniform/shapeConst*#
_class
loc:@layer_3/weights3*
valueB",  ,  *
dtype0*
_output_shapes
:
�
/layer_3/weights3/Initializer/random_uniform/minConst*#
_class
loc:@layer_3/weights3*
valueB
 *��̽*
dtype0*
_output_shapes
: 
�
/layer_3/weights3/Initializer/random_uniform/maxConst*#
_class
loc:@layer_3/weights3*
valueB
 *���=*
dtype0*
_output_shapes
: 
�
9layer_3/weights3/Initializer/random_uniform/RandomUniformRandomUniform1layer_3/weights3/Initializer/random_uniform/shape*
dtype0* 
_output_shapes
:
��*

seed *
T0*#
_class
loc:@layer_3/weights3*
seed2 
�
/layer_3/weights3/Initializer/random_uniform/subSub/layer_3/weights3/Initializer/random_uniform/max/layer_3/weights3/Initializer/random_uniform/min*
_output_shapes
: *
T0*#
_class
loc:@layer_3/weights3
�
/layer_3/weights3/Initializer/random_uniform/mulMul9layer_3/weights3/Initializer/random_uniform/RandomUniform/layer_3/weights3/Initializer/random_uniform/sub*
T0*#
_class
loc:@layer_3/weights3* 
_output_shapes
:
��
�
+layer_3/weights3/Initializer/random_uniformAdd/layer_3/weights3/Initializer/random_uniform/mul/layer_3/weights3/Initializer/random_uniform/min* 
_output_shapes
:
��*
T0*#
_class
loc:@layer_3/weights3
�
layer_3/weights3
VariableV2*
dtype0* 
_output_shapes
:
��*
shared_name *#
_class
loc:@layer_3/weights3*
	container *
shape:
��
�
layer_3/weights3/AssignAssignlayer_3/weights3+layer_3/weights3/Initializer/random_uniform*
use_locking(*
T0*#
_class
loc:@layer_3/weights3*
validate_shape(* 
_output_shapes
:
��
�
layer_3/weights3/readIdentitylayer_3/weights3*
T0*#
_class
loc:@layer_3/weights3* 
_output_shapes
:
��
�
!layer_3/biases3/Initializer/zerosConst*"
_class
loc:@layer_3/biases3*
valueB�*    *
dtype0*
_output_shapes	
:�
�
layer_3/biases3
VariableV2*
shared_name *"
_class
loc:@layer_3/biases3*
	container *
shape:�*
dtype0*
_output_shapes	
:�
�
layer_3/biases3/AssignAssignlayer_3/biases3!layer_3/biases3/Initializer/zeros*
_output_shapes	
:�*
use_locking(*
T0*"
_class
loc:@layer_3/biases3*
validate_shape(
{
layer_3/biases3/readIdentitylayer_3/biases3*
_output_shapes	
:�*
T0*"
_class
loc:@layer_3/biases3
�
layer_3/MatMulMatMullayer_2/Sigmoidlayer_3/weights3/read*
T0*(
_output_shapes
:����������*
transpose_a( *
transpose_b( 
k
layer_3/addAddlayer_3/MatMullayer_3/biases3/read*
T0*(
_output_shapes
:����������
Z
layer_3/SigmoidSigmoidlayer_3/add*
T0*(
_output_shapes
:����������
�
1layer_4/weights4/Initializer/random_uniform/shapeConst*#
_class
loc:@layer_4/weights4*
valueB",  2   *
dtype0*
_output_shapes
:
�
/layer_4/weights4/Initializer/random_uniform/minConst*
_output_shapes
: *#
_class
loc:@layer_4/weights4*
valueB
 *��*
dtype0
�
/layer_4/weights4/Initializer/random_uniform/maxConst*#
_class
loc:@layer_4/weights4*
valueB
 *�>*
dtype0*
_output_shapes
: 
�
9layer_4/weights4/Initializer/random_uniform/RandomUniformRandomUniform1layer_4/weights4/Initializer/random_uniform/shape*
seed2 *
dtype0*
_output_shapes
:	�2*

seed *
T0*#
_class
loc:@layer_4/weights4
�
/layer_4/weights4/Initializer/random_uniform/subSub/layer_4/weights4/Initializer/random_uniform/max/layer_4/weights4/Initializer/random_uniform/min*
T0*#
_class
loc:@layer_4/weights4*
_output_shapes
: 
�
/layer_4/weights4/Initializer/random_uniform/mulMul9layer_4/weights4/Initializer/random_uniform/RandomUniform/layer_4/weights4/Initializer/random_uniform/sub*
_output_shapes
:	�2*
T0*#
_class
loc:@layer_4/weights4
�
+layer_4/weights4/Initializer/random_uniformAdd/layer_4/weights4/Initializer/random_uniform/mul/layer_4/weights4/Initializer/random_uniform/min*#
_class
loc:@layer_4/weights4*
_output_shapes
:	�2*
T0
�
layer_4/weights4
VariableV2*
shared_name *#
_class
loc:@layer_4/weights4*
	container *
shape:	�2*
dtype0*
_output_shapes
:	�2
�
layer_4/weights4/AssignAssignlayer_4/weights4+layer_4/weights4/Initializer/random_uniform*#
_class
loc:@layer_4/weights4*
validate_shape(*
_output_shapes
:	�2*
use_locking(*
T0
�
layer_4/weights4/readIdentitylayer_4/weights4*
T0*#
_class
loc:@layer_4/weights4*
_output_shapes
:	�2
�
!layer_4/biases4/Initializer/zerosConst*"
_class
loc:@layer_4/biases4*
valueB2*    *
dtype0*
_output_shapes
:2
�
layer_4/biases4
VariableV2*"
_class
loc:@layer_4/biases4*
	container *
shape:2*
dtype0*
_output_shapes
:2*
shared_name 
�
layer_4/biases4/AssignAssignlayer_4/biases4!layer_4/biases4/Initializer/zeros*"
_class
loc:@layer_4/biases4*
validate_shape(*
_output_shapes
:2*
use_locking(*
T0
z
layer_4/biases4/readIdentitylayer_4/biases4*"
_class
loc:@layer_4/biases4*
_output_shapes
:2*
T0
�
layer_4/MatMulMatMullayer_3/Sigmoidlayer_4/weights4/read*'
_output_shapes
:���������2*
transpose_a( *
transpose_b( *
T0
j
layer_4/addAddlayer_4/MatMullayer_4/biases4/read*
T0*'
_output_shapes
:���������2
Y
layer_4/SigmoidSigmoidlayer_4/add*'
_output_shapes
:���������2*
T0
�
0output/weights5/Initializer/random_uniform/shapeConst*"
_class
loc:@output/weights5*
valueB"2      *
dtype0*
_output_shapes
:
�
.output/weights5/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *"
_class
loc:@output/weights5*
valueB
 *S���
�
.output/weights5/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *"
_class
loc:@output/weights5*
valueB
 *S��>
�
8output/weights5/Initializer/random_uniform/RandomUniformRandomUniform0output/weights5/Initializer/random_uniform/shape*
_output_shapes

:2*

seed *
T0*"
_class
loc:@output/weights5*
seed2 *
dtype0
�
.output/weights5/Initializer/random_uniform/subSub.output/weights5/Initializer/random_uniform/max.output/weights5/Initializer/random_uniform/min*
_output_shapes
: *
T0*"
_class
loc:@output/weights5
�
.output/weights5/Initializer/random_uniform/mulMul8output/weights5/Initializer/random_uniform/RandomUniform.output/weights5/Initializer/random_uniform/sub*
T0*"
_class
loc:@output/weights5*
_output_shapes

:2
�
*output/weights5/Initializer/random_uniformAdd.output/weights5/Initializer/random_uniform/mul.output/weights5/Initializer/random_uniform/min*
T0*"
_class
loc:@output/weights5*
_output_shapes

:2
�
output/weights5
VariableV2*
dtype0*
_output_shapes

:2*
shared_name *"
_class
loc:@output/weights5*
	container *
shape
:2
�
output/weights5/AssignAssignoutput/weights5*output/weights5/Initializer/random_uniform*
T0*"
_class
loc:@output/weights5*
validate_shape(*
_output_shapes

:2*
use_locking(
~
output/weights5/readIdentityoutput/weights5*
_output_shapes

:2*
T0*"
_class
loc:@output/weights5
�
 output/biases5/Initializer/zerosConst*!
_class
loc:@output/biases5*
valueB*    *
dtype0*
_output_shapes
:
�
output/biases5
VariableV2*
	container *
shape:*
dtype0*
_output_shapes
:*
shared_name *!
_class
loc:@output/biases5
�
output/biases5/AssignAssignoutput/biases5 output/biases5/Initializer/zeros*
_output_shapes
:*
use_locking(*
T0*!
_class
loc:@output/biases5*
validate_shape(
w
output/biases5/readIdentityoutput/biases5*
_output_shapes
:*
T0*!
_class
loc:@output/biases5
�
output/MatMulMatMullayer_4/Sigmoidoutput/weights5/read*
T0*'
_output_shapes
:���������*
transpose_a( *
transpose_b( 
g

output/addAddoutput/MatMuloutput/biases5/read*
T0*'
_output_shapes
:���������
s
cost/PlaceholderPlaceholder*
dtype0*'
_output_shapes
:���������*
shape:���������
{
cost/SquaredDifferenceSquaredDifference
output/addcost/Placeholder*'
_output_shapes
:���������*
T0
[

cost/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
s
	cost/MeanMeancost/SquaredDifference
cost/Const*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
X
train/gradients/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
^
train/gradients/grad_ys_0Const*
valueB
 *  �?*
dtype0*
_output_shapes
: 
�
train/gradients/FillFilltrain/gradients/Shapetrain/gradients/grad_ys_0*
T0*

index_type0*
_output_shapes
: 
}
,train/gradients/cost/Mean_grad/Reshape/shapeConst*
valueB"      *
dtype0*
_output_shapes
:
�
&train/gradients/cost/Mean_grad/ReshapeReshapetrain/gradients/Fill,train/gradients/cost/Mean_grad/Reshape/shape*
_output_shapes

:*
T0*
Tshape0
z
$train/gradients/cost/Mean_grad/ShapeShapecost/SquaredDifference*
T0*
out_type0*
_output_shapes
:
�
#train/gradients/cost/Mean_grad/TileTile&train/gradients/cost/Mean_grad/Reshape$train/gradients/cost/Mean_grad/Shape*

Tmultiples0*
T0*'
_output_shapes
:���������
|
&train/gradients/cost/Mean_grad/Shape_1Shapecost/SquaredDifference*
T0*
out_type0*
_output_shapes
:
i
&train/gradients/cost/Mean_grad/Shape_2Const*
valueB *
dtype0*
_output_shapes
: 
n
$train/gradients/cost/Mean_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:
�
#train/gradients/cost/Mean_grad/ProdProd&train/gradients/cost/Mean_grad/Shape_1$train/gradients/cost/Mean_grad/Const*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
p
&train/gradients/cost/Mean_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
�
%train/gradients/cost/Mean_grad/Prod_1Prod&train/gradients/cost/Mean_grad/Shape_2&train/gradients/cost/Mean_grad/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
j
(train/gradients/cost/Mean_grad/Maximum/yConst*
value	B :*
dtype0*
_output_shapes
: 
�
&train/gradients/cost/Mean_grad/MaximumMaximum%train/gradients/cost/Mean_grad/Prod_1(train/gradients/cost/Mean_grad/Maximum/y*
_output_shapes
: *
T0
�
'train/gradients/cost/Mean_grad/floordivFloorDiv#train/gradients/cost/Mean_grad/Prod&train/gradients/cost/Mean_grad/Maximum*
_output_shapes
: *
T0
�
#train/gradients/cost/Mean_grad/CastCast'train/gradients/cost/Mean_grad/floordiv*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
�
&train/gradients/cost/Mean_grad/truedivRealDiv#train/gradients/cost/Mean_grad/Tile#train/gradients/cost/Mean_grad/Cast*
T0*'
_output_shapes
:���������
{
1train/gradients/cost/SquaredDifference_grad/ShapeShape
output/add*
_output_shapes
:*
T0*
out_type0
�
3train/gradients/cost/SquaredDifference_grad/Shape_1Shapecost/Placeholder*
T0*
out_type0*
_output_shapes
:
�
Atrain/gradients/cost/SquaredDifference_grad/BroadcastGradientArgsBroadcastGradientArgs1train/gradients/cost/SquaredDifference_grad/Shape3train/gradients/cost/SquaredDifference_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
2train/gradients/cost/SquaredDifference_grad/scalarConst'^train/gradients/cost/Mean_grad/truediv*
dtype0*
_output_shapes
: *
valueB
 *   @
�
/train/gradients/cost/SquaredDifference_grad/mulMul2train/gradients/cost/SquaredDifference_grad/scalar&train/gradients/cost/Mean_grad/truediv*
T0*'
_output_shapes
:���������
�
/train/gradients/cost/SquaredDifference_grad/subSub
output/addcost/Placeholder'^train/gradients/cost/Mean_grad/truediv*
T0*'
_output_shapes
:���������
�
1train/gradients/cost/SquaredDifference_grad/mul_1Mul/train/gradients/cost/SquaredDifference_grad/mul/train/gradients/cost/SquaredDifference_grad/sub*'
_output_shapes
:���������*
T0
�
/train/gradients/cost/SquaredDifference_grad/SumSum1train/gradients/cost/SquaredDifference_grad/mul_1Atrain/gradients/cost/SquaredDifference_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
3train/gradients/cost/SquaredDifference_grad/ReshapeReshape/train/gradients/cost/SquaredDifference_grad/Sum1train/gradients/cost/SquaredDifference_grad/Shape*
T0*
Tshape0*'
_output_shapes
:���������
�
1train/gradients/cost/SquaredDifference_grad/Sum_1Sum1train/gradients/cost/SquaredDifference_grad/mul_1Ctrain/gradients/cost/SquaredDifference_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
�
5train/gradients/cost/SquaredDifference_grad/Reshape_1Reshape1train/gradients/cost/SquaredDifference_grad/Sum_13train/gradients/cost/SquaredDifference_grad/Shape_1*
T0*
Tshape0*'
_output_shapes
:���������
�
/train/gradients/cost/SquaredDifference_grad/NegNeg5train/gradients/cost/SquaredDifference_grad/Reshape_1*'
_output_shapes
:���������*
T0
�
<train/gradients/cost/SquaredDifference_grad/tuple/group_depsNoOp0^train/gradients/cost/SquaredDifference_grad/Neg4^train/gradients/cost/SquaredDifference_grad/Reshape
�
Dtrain/gradients/cost/SquaredDifference_grad/tuple/control_dependencyIdentity3train/gradients/cost/SquaredDifference_grad/Reshape=^train/gradients/cost/SquaredDifference_grad/tuple/group_deps*'
_output_shapes
:���������*
T0*F
_class<
:8loc:@train/gradients/cost/SquaredDifference_grad/Reshape
�
Ftrain/gradients/cost/SquaredDifference_grad/tuple/control_dependency_1Identity/train/gradients/cost/SquaredDifference_grad/Neg=^train/gradients/cost/SquaredDifference_grad/tuple/group_deps*
T0*B
_class8
64loc:@train/gradients/cost/SquaredDifference_grad/Neg*'
_output_shapes
:���������
r
%train/gradients/output/add_grad/ShapeShapeoutput/MatMul*
T0*
out_type0*
_output_shapes
:
q
'train/gradients/output/add_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
�
5train/gradients/output/add_grad/BroadcastGradientArgsBroadcastGradientArgs%train/gradients/output/add_grad/Shape'train/gradients/output/add_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
#train/gradients/output/add_grad/SumSumDtrain/gradients/cost/SquaredDifference_grad/tuple/control_dependency5train/gradients/output/add_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
�
'train/gradients/output/add_grad/ReshapeReshape#train/gradients/output/add_grad/Sum%train/gradients/output/add_grad/Shape*
T0*
Tshape0*'
_output_shapes
:���������
�
%train/gradients/output/add_grad/Sum_1SumDtrain/gradients/cost/SquaredDifference_grad/tuple/control_dependency7train/gradients/output/add_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
)train/gradients/output/add_grad/Reshape_1Reshape%train/gradients/output/add_grad/Sum_1'train/gradients/output/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
�
0train/gradients/output/add_grad/tuple/group_depsNoOp(^train/gradients/output/add_grad/Reshape*^train/gradients/output/add_grad/Reshape_1
�
8train/gradients/output/add_grad/tuple/control_dependencyIdentity'train/gradients/output/add_grad/Reshape1^train/gradients/output/add_grad/tuple/group_deps*
T0*:
_class0
.,loc:@train/gradients/output/add_grad/Reshape*'
_output_shapes
:���������
�
:train/gradients/output/add_grad/tuple/control_dependency_1Identity)train/gradients/output/add_grad/Reshape_11^train/gradients/output/add_grad/tuple/group_deps*<
_class2
0.loc:@train/gradients/output/add_grad/Reshape_1*
_output_shapes
:*
T0
�
)train/gradients/output/MatMul_grad/MatMulMatMul8train/gradients/output/add_grad/tuple/control_dependencyoutput/weights5/read*
T0*'
_output_shapes
:���������2*
transpose_a( *
transpose_b(
�
+train/gradients/output/MatMul_grad/MatMul_1MatMullayer_4/Sigmoid8train/gradients/output/add_grad/tuple/control_dependency*
T0*
_output_shapes

:2*
transpose_a(*
transpose_b( 
�
3train/gradients/output/MatMul_grad/tuple/group_depsNoOp*^train/gradients/output/MatMul_grad/MatMul,^train/gradients/output/MatMul_grad/MatMul_1
�
;train/gradients/output/MatMul_grad/tuple/control_dependencyIdentity)train/gradients/output/MatMul_grad/MatMul4^train/gradients/output/MatMul_grad/tuple/group_deps*
T0*<
_class2
0.loc:@train/gradients/output/MatMul_grad/MatMul*'
_output_shapes
:���������2
�
=train/gradients/output/MatMul_grad/tuple/control_dependency_1Identity+train/gradients/output/MatMul_grad/MatMul_14^train/gradients/output/MatMul_grad/tuple/group_deps*
T0*>
_class4
20loc:@train/gradients/output/MatMul_grad/MatMul_1*
_output_shapes

:2
�
0train/gradients/layer_4/Sigmoid_grad/SigmoidGradSigmoidGradlayer_4/Sigmoid;train/gradients/output/MatMul_grad/tuple/control_dependency*
T0*'
_output_shapes
:���������2
t
&train/gradients/layer_4/add_grad/ShapeShapelayer_4/MatMul*
out_type0*
_output_shapes
:*
T0
r
(train/gradients/layer_4/add_grad/Shape_1Const*
valueB:2*
dtype0*
_output_shapes
:
�
6train/gradients/layer_4/add_grad/BroadcastGradientArgsBroadcastGradientArgs&train/gradients/layer_4/add_grad/Shape(train/gradients/layer_4/add_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
$train/gradients/layer_4/add_grad/SumSum0train/gradients/layer_4/Sigmoid_grad/SigmoidGrad6train/gradients/layer_4/add_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
(train/gradients/layer_4/add_grad/ReshapeReshape$train/gradients/layer_4/add_grad/Sum&train/gradients/layer_4/add_grad/Shape*
T0*
Tshape0*'
_output_shapes
:���������2
�
&train/gradients/layer_4/add_grad/Sum_1Sum0train/gradients/layer_4/Sigmoid_grad/SigmoidGrad8train/gradients/layer_4/add_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
*train/gradients/layer_4/add_grad/Reshape_1Reshape&train/gradients/layer_4/add_grad/Sum_1(train/gradients/layer_4/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:2
�
1train/gradients/layer_4/add_grad/tuple/group_depsNoOp)^train/gradients/layer_4/add_grad/Reshape+^train/gradients/layer_4/add_grad/Reshape_1
�
9train/gradients/layer_4/add_grad/tuple/control_dependencyIdentity(train/gradients/layer_4/add_grad/Reshape2^train/gradients/layer_4/add_grad/tuple/group_deps*'
_output_shapes
:���������2*
T0*;
_class1
/-loc:@train/gradients/layer_4/add_grad/Reshape
�
;train/gradients/layer_4/add_grad/tuple/control_dependency_1Identity*train/gradients/layer_4/add_grad/Reshape_12^train/gradients/layer_4/add_grad/tuple/group_deps*
T0*=
_class3
1/loc:@train/gradients/layer_4/add_grad/Reshape_1*
_output_shapes
:2
�
*train/gradients/layer_4/MatMul_grad/MatMulMatMul9train/gradients/layer_4/add_grad/tuple/control_dependencylayer_4/weights4/read*
T0*(
_output_shapes
:����������*
transpose_a( *
transpose_b(
�
,train/gradients/layer_4/MatMul_grad/MatMul_1MatMullayer_3/Sigmoid9train/gradients/layer_4/add_grad/tuple/control_dependency*
T0*
_output_shapes
:	�2*
transpose_a(*
transpose_b( 
�
4train/gradients/layer_4/MatMul_grad/tuple/group_depsNoOp+^train/gradients/layer_4/MatMul_grad/MatMul-^train/gradients/layer_4/MatMul_grad/MatMul_1
�
<train/gradients/layer_4/MatMul_grad/tuple/control_dependencyIdentity*train/gradients/layer_4/MatMul_grad/MatMul5^train/gradients/layer_4/MatMul_grad/tuple/group_deps*
T0*=
_class3
1/loc:@train/gradients/layer_4/MatMul_grad/MatMul*(
_output_shapes
:����������
�
>train/gradients/layer_4/MatMul_grad/tuple/control_dependency_1Identity,train/gradients/layer_4/MatMul_grad/MatMul_15^train/gradients/layer_4/MatMul_grad/tuple/group_deps*
T0*?
_class5
31loc:@train/gradients/layer_4/MatMul_grad/MatMul_1*
_output_shapes
:	�2
�
0train/gradients/layer_3/Sigmoid_grad/SigmoidGradSigmoidGradlayer_3/Sigmoid<train/gradients/layer_4/MatMul_grad/tuple/control_dependency*
T0*(
_output_shapes
:����������
t
&train/gradients/layer_3/add_grad/ShapeShapelayer_3/MatMul*
T0*
out_type0*
_output_shapes
:
s
(train/gradients/layer_3/add_grad/Shape_1Const*
valueB:�*
dtype0*
_output_shapes
:
�
6train/gradients/layer_3/add_grad/BroadcastGradientArgsBroadcastGradientArgs&train/gradients/layer_3/add_grad/Shape(train/gradients/layer_3/add_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
$train/gradients/layer_3/add_grad/SumSum0train/gradients/layer_3/Sigmoid_grad/SigmoidGrad6train/gradients/layer_3/add_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
(train/gradients/layer_3/add_grad/ReshapeReshape$train/gradients/layer_3/add_grad/Sum&train/gradients/layer_3/add_grad/Shape*
T0*
Tshape0*(
_output_shapes
:����������
�
&train/gradients/layer_3/add_grad/Sum_1Sum0train/gradients/layer_3/Sigmoid_grad/SigmoidGrad8train/gradients/layer_3/add_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
�
*train/gradients/layer_3/add_grad/Reshape_1Reshape&train/gradients/layer_3/add_grad/Sum_1(train/gradients/layer_3/add_grad/Shape_1*
_output_shapes	
:�*
T0*
Tshape0
�
1train/gradients/layer_3/add_grad/tuple/group_depsNoOp)^train/gradients/layer_3/add_grad/Reshape+^train/gradients/layer_3/add_grad/Reshape_1
�
9train/gradients/layer_3/add_grad/tuple/control_dependencyIdentity(train/gradients/layer_3/add_grad/Reshape2^train/gradients/layer_3/add_grad/tuple/group_deps*;
_class1
/-loc:@train/gradients/layer_3/add_grad/Reshape*(
_output_shapes
:����������*
T0
�
;train/gradients/layer_3/add_grad/tuple/control_dependency_1Identity*train/gradients/layer_3/add_grad/Reshape_12^train/gradients/layer_3/add_grad/tuple/group_deps*
T0*=
_class3
1/loc:@train/gradients/layer_3/add_grad/Reshape_1*
_output_shapes	
:�
�
*train/gradients/layer_3/MatMul_grad/MatMulMatMul9train/gradients/layer_3/add_grad/tuple/control_dependencylayer_3/weights3/read*(
_output_shapes
:����������*
transpose_a( *
transpose_b(*
T0
�
,train/gradients/layer_3/MatMul_grad/MatMul_1MatMullayer_2/Sigmoid9train/gradients/layer_3/add_grad/tuple/control_dependency*
T0* 
_output_shapes
:
��*
transpose_a(*
transpose_b( 
�
4train/gradients/layer_3/MatMul_grad/tuple/group_depsNoOp+^train/gradients/layer_3/MatMul_grad/MatMul-^train/gradients/layer_3/MatMul_grad/MatMul_1
�
<train/gradients/layer_3/MatMul_grad/tuple/control_dependencyIdentity*train/gradients/layer_3/MatMul_grad/MatMul5^train/gradients/layer_3/MatMul_grad/tuple/group_deps*
T0*=
_class3
1/loc:@train/gradients/layer_3/MatMul_grad/MatMul*(
_output_shapes
:����������
�
>train/gradients/layer_3/MatMul_grad/tuple/control_dependency_1Identity,train/gradients/layer_3/MatMul_grad/MatMul_15^train/gradients/layer_3/MatMul_grad/tuple/group_deps*
T0*?
_class5
31loc:@train/gradients/layer_3/MatMul_grad/MatMul_1* 
_output_shapes
:
��
�
0train/gradients/layer_2/Sigmoid_grad/SigmoidGradSigmoidGradlayer_2/Sigmoid<train/gradients/layer_3/MatMul_grad/tuple/control_dependency*
T0*(
_output_shapes
:����������
t
&train/gradients/layer_2/add_grad/ShapeShapelayer_2/MatMul*
T0*
out_type0*
_output_shapes
:
s
(train/gradients/layer_2/add_grad/Shape_1Const*
_output_shapes
:*
valueB:�*
dtype0
�
6train/gradients/layer_2/add_grad/BroadcastGradientArgsBroadcastGradientArgs&train/gradients/layer_2/add_grad/Shape(train/gradients/layer_2/add_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
$train/gradients/layer_2/add_grad/SumSum0train/gradients/layer_2/Sigmoid_grad/SigmoidGrad6train/gradients/layer_2/add_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
�
(train/gradients/layer_2/add_grad/ReshapeReshape$train/gradients/layer_2/add_grad/Sum&train/gradients/layer_2/add_grad/Shape*
T0*
Tshape0*(
_output_shapes
:����������
�
&train/gradients/layer_2/add_grad/Sum_1Sum0train/gradients/layer_2/Sigmoid_grad/SigmoidGrad8train/gradients/layer_2/add_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
*train/gradients/layer_2/add_grad/Reshape_1Reshape&train/gradients/layer_2/add_grad/Sum_1(train/gradients/layer_2/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes	
:�
�
1train/gradients/layer_2/add_grad/tuple/group_depsNoOp)^train/gradients/layer_2/add_grad/Reshape+^train/gradients/layer_2/add_grad/Reshape_1
�
9train/gradients/layer_2/add_grad/tuple/control_dependencyIdentity(train/gradients/layer_2/add_grad/Reshape2^train/gradients/layer_2/add_grad/tuple/group_deps*
T0*;
_class1
/-loc:@train/gradients/layer_2/add_grad/Reshape*(
_output_shapes
:����������
�
;train/gradients/layer_2/add_grad/tuple/control_dependency_1Identity*train/gradients/layer_2/add_grad/Reshape_12^train/gradients/layer_2/add_grad/tuple/group_deps*
T0*=
_class3
1/loc:@train/gradients/layer_2/add_grad/Reshape_1*
_output_shapes	
:�
�
*train/gradients/layer_2/MatMul_grad/MatMulMatMul9train/gradients/layer_2/add_grad/tuple/control_dependencylayer_2/weights2/read*
T0*'
_output_shapes
:���������2*
transpose_a( *
transpose_b(
�
,train/gradients/layer_2/MatMul_grad/MatMul_1MatMullayer_1/Sigmoid9train/gradients/layer_2/add_grad/tuple/control_dependency*
T0*
_output_shapes
:	2�*
transpose_a(*
transpose_b( 
�
4train/gradients/layer_2/MatMul_grad/tuple/group_depsNoOp+^train/gradients/layer_2/MatMul_grad/MatMul-^train/gradients/layer_2/MatMul_grad/MatMul_1
�
<train/gradients/layer_2/MatMul_grad/tuple/control_dependencyIdentity*train/gradients/layer_2/MatMul_grad/MatMul5^train/gradients/layer_2/MatMul_grad/tuple/group_deps*
T0*=
_class3
1/loc:@train/gradients/layer_2/MatMul_grad/MatMul*'
_output_shapes
:���������2
�
>train/gradients/layer_2/MatMul_grad/tuple/control_dependency_1Identity,train/gradients/layer_2/MatMul_grad/MatMul_15^train/gradients/layer_2/MatMul_grad/tuple/group_deps*
T0*?
_class5
31loc:@train/gradients/layer_2/MatMul_grad/MatMul_1*
_output_shapes
:	2�
�
0train/gradients/layer_1/Sigmoid_grad/SigmoidGradSigmoidGradlayer_1/Sigmoid<train/gradients/layer_2/MatMul_grad/tuple/control_dependency*'
_output_shapes
:���������2*
T0
t
&train/gradients/layer_1/add_grad/ShapeShapelayer_1/MatMul*
_output_shapes
:*
T0*
out_type0
r
(train/gradients/layer_1/add_grad/Shape_1Const*
valueB:2*
dtype0*
_output_shapes
:
�
6train/gradients/layer_1/add_grad/BroadcastGradientArgsBroadcastGradientArgs&train/gradients/layer_1/add_grad/Shape(train/gradients/layer_1/add_grad/Shape_1*2
_output_shapes 
:���������:���������*
T0
�
$train/gradients/layer_1/add_grad/SumSum0train/gradients/layer_1/Sigmoid_grad/SigmoidGrad6train/gradients/layer_1/add_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
(train/gradients/layer_1/add_grad/ReshapeReshape$train/gradients/layer_1/add_grad/Sum&train/gradients/layer_1/add_grad/Shape*'
_output_shapes
:���������2*
T0*
Tshape0
�
&train/gradients/layer_1/add_grad/Sum_1Sum0train/gradients/layer_1/Sigmoid_grad/SigmoidGrad8train/gradients/layer_1/add_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
�
*train/gradients/layer_1/add_grad/Reshape_1Reshape&train/gradients/layer_1/add_grad/Sum_1(train/gradients/layer_1/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:2
�
1train/gradients/layer_1/add_grad/tuple/group_depsNoOp)^train/gradients/layer_1/add_grad/Reshape+^train/gradients/layer_1/add_grad/Reshape_1
�
9train/gradients/layer_1/add_grad/tuple/control_dependencyIdentity(train/gradients/layer_1/add_grad/Reshape2^train/gradients/layer_1/add_grad/tuple/group_deps*
T0*;
_class1
/-loc:@train/gradients/layer_1/add_grad/Reshape*'
_output_shapes
:���������2
�
;train/gradients/layer_1/add_grad/tuple/control_dependency_1Identity*train/gradients/layer_1/add_grad/Reshape_12^train/gradients/layer_1/add_grad/tuple/group_deps*
T0*=
_class3
1/loc:@train/gradients/layer_1/add_grad/Reshape_1*
_output_shapes
:2
�
*train/gradients/layer_1/MatMul_grad/MatMulMatMul9train/gradients/layer_1/add_grad/tuple/control_dependencylayer_1/weights1/read*'
_output_shapes
:���������*
transpose_a( *
transpose_b(*
T0
�
,train/gradients/layer_1/MatMul_grad/MatMul_1MatMulinput/Placeholder9train/gradients/layer_1/add_grad/tuple/control_dependency*
T0*
_output_shapes

:2*
transpose_a(*
transpose_b( 
�
4train/gradients/layer_1/MatMul_grad/tuple/group_depsNoOp+^train/gradients/layer_1/MatMul_grad/MatMul-^train/gradients/layer_1/MatMul_grad/MatMul_1
�
<train/gradients/layer_1/MatMul_grad/tuple/control_dependencyIdentity*train/gradients/layer_1/MatMul_grad/MatMul5^train/gradients/layer_1/MatMul_grad/tuple/group_deps*
T0*=
_class3
1/loc:@train/gradients/layer_1/MatMul_grad/MatMul*'
_output_shapes
:���������
�
>train/gradients/layer_1/MatMul_grad/tuple/control_dependency_1Identity,train/gradients/layer_1/MatMul_grad/MatMul_15^train/gradients/layer_1/MatMul_grad/tuple/group_deps*?
_class5
31loc:@train/gradients/layer_1/MatMul_grad/MatMul_1*
_output_shapes

:2*
T0
�
train/beta1_power/initial_valueConst*"
_class
loc:@layer_1/biases1*
valueB
 *fff?*
dtype0*
_output_shapes
: 
�
train/beta1_power
VariableV2*
shape: *
dtype0*
_output_shapes
: *
shared_name *"
_class
loc:@layer_1/biases1*
	container 
�
train/beta1_power/AssignAssigntrain/beta1_powertrain/beta1_power/initial_value*
use_locking(*
T0*"
_class
loc:@layer_1/biases1*
validate_shape(*
_output_shapes
: 
z
train/beta1_power/readIdentitytrain/beta1_power*
T0*"
_class
loc:@layer_1/biases1*
_output_shapes
: 
�
train/beta2_power/initial_valueConst*"
_class
loc:@layer_1/biases1*
valueB
 *w�?*
dtype0*
_output_shapes
: 
�
train/beta2_power
VariableV2*
shape: *
dtype0*
_output_shapes
: *
shared_name *"
_class
loc:@layer_1/biases1*
	container 
�
train/beta2_power/AssignAssigntrain/beta2_powertrain/beta2_power/initial_value*
T0*"
_class
loc:@layer_1/biases1*
validate_shape(*
_output_shapes
: *
use_locking(
z
train/beta2_power/readIdentitytrain/beta2_power*
T0*"
_class
loc:@layer_1/biases1*
_output_shapes
: 
�
-train/layer_1/weights1/Adam/Initializer/zerosConst*#
_class
loc:@layer_1/weights1*
valueB2*    *
dtype0*
_output_shapes

:2
�
train/layer_1/weights1/Adam
VariableV2*
_output_shapes

:2*
shared_name *#
_class
loc:@layer_1/weights1*
	container *
shape
:2*
dtype0
�
"train/layer_1/weights1/Adam/AssignAssigntrain/layer_1/weights1/Adam-train/layer_1/weights1/Adam/Initializer/zeros*
use_locking(*
T0*#
_class
loc:@layer_1/weights1*
validate_shape(*
_output_shapes

:2
�
 train/layer_1/weights1/Adam/readIdentitytrain/layer_1/weights1/Adam*
T0*#
_class
loc:@layer_1/weights1*
_output_shapes

:2
�
/train/layer_1/weights1/Adam_1/Initializer/zerosConst*#
_class
loc:@layer_1/weights1*
valueB2*    *
dtype0*
_output_shapes

:2
�
train/layer_1/weights1/Adam_1
VariableV2*
dtype0*
_output_shapes

:2*
shared_name *#
_class
loc:@layer_1/weights1*
	container *
shape
:2
�
$train/layer_1/weights1/Adam_1/AssignAssigntrain/layer_1/weights1/Adam_1/train/layer_1/weights1/Adam_1/Initializer/zeros*
T0*#
_class
loc:@layer_1/weights1*
validate_shape(*
_output_shapes

:2*
use_locking(
�
"train/layer_1/weights1/Adam_1/readIdentitytrain/layer_1/weights1/Adam_1*
T0*#
_class
loc:@layer_1/weights1*
_output_shapes

:2
�
,train/layer_1/biases1/Adam/Initializer/zerosConst*"
_class
loc:@layer_1/biases1*
valueB2*    *
dtype0*
_output_shapes
:2
�
train/layer_1/biases1/Adam
VariableV2*"
_class
loc:@layer_1/biases1*
	container *
shape:2*
dtype0*
_output_shapes
:2*
shared_name 
�
!train/layer_1/biases1/Adam/AssignAssigntrain/layer_1/biases1/Adam,train/layer_1/biases1/Adam/Initializer/zeros*"
_class
loc:@layer_1/biases1*
validate_shape(*
_output_shapes
:2*
use_locking(*
T0
�
train/layer_1/biases1/Adam/readIdentitytrain/layer_1/biases1/Adam*
T0*"
_class
loc:@layer_1/biases1*
_output_shapes
:2
�
.train/layer_1/biases1/Adam_1/Initializer/zerosConst*"
_class
loc:@layer_1/biases1*
valueB2*    *
dtype0*
_output_shapes
:2
�
train/layer_1/biases1/Adam_1
VariableV2*
shared_name *"
_class
loc:@layer_1/biases1*
	container *
shape:2*
dtype0*
_output_shapes
:2
�
#train/layer_1/biases1/Adam_1/AssignAssigntrain/layer_1/biases1/Adam_1.train/layer_1/biases1/Adam_1/Initializer/zeros*
use_locking(*
T0*"
_class
loc:@layer_1/biases1*
validate_shape(*
_output_shapes
:2
�
!train/layer_1/biases1/Adam_1/readIdentitytrain/layer_1/biases1/Adam_1*"
_class
loc:@layer_1/biases1*
_output_shapes
:2*
T0
�
=train/layer_2/weights2/Adam/Initializer/zeros/shape_as_tensorConst*#
_class
loc:@layer_2/weights2*
valueB"2   ,  *
dtype0*
_output_shapes
:
�
3train/layer_2/weights2/Adam/Initializer/zeros/ConstConst*
dtype0*
_output_shapes
: *#
_class
loc:@layer_2/weights2*
valueB
 *    
�
-train/layer_2/weights2/Adam/Initializer/zerosFill=train/layer_2/weights2/Adam/Initializer/zeros/shape_as_tensor3train/layer_2/weights2/Adam/Initializer/zeros/Const*
T0*#
_class
loc:@layer_2/weights2*

index_type0*
_output_shapes
:	2�
�
train/layer_2/weights2/Adam
VariableV2*
dtype0*
_output_shapes
:	2�*
shared_name *#
_class
loc:@layer_2/weights2*
	container *
shape:	2�
�
"train/layer_2/weights2/Adam/AssignAssigntrain/layer_2/weights2/Adam-train/layer_2/weights2/Adam/Initializer/zeros*
T0*#
_class
loc:@layer_2/weights2*
validate_shape(*
_output_shapes
:	2�*
use_locking(
�
 train/layer_2/weights2/Adam/readIdentitytrain/layer_2/weights2/Adam*
T0*#
_class
loc:@layer_2/weights2*
_output_shapes
:	2�
�
?train/layer_2/weights2/Adam_1/Initializer/zeros/shape_as_tensorConst*
dtype0*
_output_shapes
:*#
_class
loc:@layer_2/weights2*
valueB"2   ,  
�
5train/layer_2/weights2/Adam_1/Initializer/zeros/ConstConst*#
_class
loc:@layer_2/weights2*
valueB
 *    *
dtype0*
_output_shapes
: 
�
/train/layer_2/weights2/Adam_1/Initializer/zerosFill?train/layer_2/weights2/Adam_1/Initializer/zeros/shape_as_tensor5train/layer_2/weights2/Adam_1/Initializer/zeros/Const*#
_class
loc:@layer_2/weights2*

index_type0*
_output_shapes
:	2�*
T0
�
train/layer_2/weights2/Adam_1
VariableV2*#
_class
loc:@layer_2/weights2*
	container *
shape:	2�*
dtype0*
_output_shapes
:	2�*
shared_name 
�
$train/layer_2/weights2/Adam_1/AssignAssigntrain/layer_2/weights2/Adam_1/train/layer_2/weights2/Adam_1/Initializer/zeros*
_output_shapes
:	2�*
use_locking(*
T0*#
_class
loc:@layer_2/weights2*
validate_shape(
�
"train/layer_2/weights2/Adam_1/readIdentitytrain/layer_2/weights2/Adam_1*
_output_shapes
:	2�*
T0*#
_class
loc:@layer_2/weights2
�
,train/layer_2/biases2/Adam/Initializer/zerosConst*"
_class
loc:@layer_2/biases2*
valueB�*    *
dtype0*
_output_shapes	
:�
�
train/layer_2/biases2/Adam
VariableV2*
shared_name *"
_class
loc:@layer_2/biases2*
	container *
shape:�*
dtype0*
_output_shapes	
:�
�
!train/layer_2/biases2/Adam/AssignAssigntrain/layer_2/biases2/Adam,train/layer_2/biases2/Adam/Initializer/zeros*"
_class
loc:@layer_2/biases2*
validate_shape(*
_output_shapes	
:�*
use_locking(*
T0
�
train/layer_2/biases2/Adam/readIdentitytrain/layer_2/biases2/Adam*
_output_shapes	
:�*
T0*"
_class
loc:@layer_2/biases2
�
.train/layer_2/biases2/Adam_1/Initializer/zerosConst*"
_class
loc:@layer_2/biases2*
valueB�*    *
dtype0*
_output_shapes	
:�
�
train/layer_2/biases2/Adam_1
VariableV2*
_output_shapes	
:�*
shared_name *"
_class
loc:@layer_2/biases2*
	container *
shape:�*
dtype0
�
#train/layer_2/biases2/Adam_1/AssignAssigntrain/layer_2/biases2/Adam_1.train/layer_2/biases2/Adam_1/Initializer/zeros*
validate_shape(*
_output_shapes	
:�*
use_locking(*
T0*"
_class
loc:@layer_2/biases2
�
!train/layer_2/biases2/Adam_1/readIdentitytrain/layer_2/biases2/Adam_1*
T0*"
_class
loc:@layer_2/biases2*
_output_shapes	
:�
�
=train/layer_3/weights3/Adam/Initializer/zeros/shape_as_tensorConst*
dtype0*
_output_shapes
:*#
_class
loc:@layer_3/weights3*
valueB",  ,  
�
3train/layer_3/weights3/Adam/Initializer/zeros/ConstConst*#
_class
loc:@layer_3/weights3*
valueB
 *    *
dtype0*
_output_shapes
: 
�
-train/layer_3/weights3/Adam/Initializer/zerosFill=train/layer_3/weights3/Adam/Initializer/zeros/shape_as_tensor3train/layer_3/weights3/Adam/Initializer/zeros/Const*
T0*#
_class
loc:@layer_3/weights3*

index_type0* 
_output_shapes
:
��
�
train/layer_3/weights3/Adam
VariableV2*
dtype0* 
_output_shapes
:
��*
shared_name *#
_class
loc:@layer_3/weights3*
	container *
shape:
��
�
"train/layer_3/weights3/Adam/AssignAssigntrain/layer_3/weights3/Adam-train/layer_3/weights3/Adam/Initializer/zeros*#
_class
loc:@layer_3/weights3*
validate_shape(* 
_output_shapes
:
��*
use_locking(*
T0
�
 train/layer_3/weights3/Adam/readIdentitytrain/layer_3/weights3/Adam* 
_output_shapes
:
��*
T0*#
_class
loc:@layer_3/weights3
�
?train/layer_3/weights3/Adam_1/Initializer/zeros/shape_as_tensorConst*#
_class
loc:@layer_3/weights3*
valueB",  ,  *
dtype0*
_output_shapes
:
�
5train/layer_3/weights3/Adam_1/Initializer/zeros/ConstConst*#
_class
loc:@layer_3/weights3*
valueB
 *    *
dtype0*
_output_shapes
: 
�
/train/layer_3/weights3/Adam_1/Initializer/zerosFill?train/layer_3/weights3/Adam_1/Initializer/zeros/shape_as_tensor5train/layer_3/weights3/Adam_1/Initializer/zeros/Const*
T0*#
_class
loc:@layer_3/weights3*

index_type0* 
_output_shapes
:
��
�
train/layer_3/weights3/Adam_1
VariableV2*
dtype0* 
_output_shapes
:
��*
shared_name *#
_class
loc:@layer_3/weights3*
	container *
shape:
��
�
$train/layer_3/weights3/Adam_1/AssignAssigntrain/layer_3/weights3/Adam_1/train/layer_3/weights3/Adam_1/Initializer/zeros*
use_locking(*
T0*#
_class
loc:@layer_3/weights3*
validate_shape(* 
_output_shapes
:
��
�
"train/layer_3/weights3/Adam_1/readIdentitytrain/layer_3/weights3/Adam_1*
T0*#
_class
loc:@layer_3/weights3* 
_output_shapes
:
��
�
,train/layer_3/biases3/Adam/Initializer/zerosConst*"
_class
loc:@layer_3/biases3*
valueB�*    *
dtype0*
_output_shapes	
:�
�
train/layer_3/biases3/Adam
VariableV2*"
_class
loc:@layer_3/biases3*
	container *
shape:�*
dtype0*
_output_shapes	
:�*
shared_name 
�
!train/layer_3/biases3/Adam/AssignAssigntrain/layer_3/biases3/Adam,train/layer_3/biases3/Adam/Initializer/zeros*
T0*"
_class
loc:@layer_3/biases3*
validate_shape(*
_output_shapes	
:�*
use_locking(
�
train/layer_3/biases3/Adam/readIdentitytrain/layer_3/biases3/Adam*
T0*"
_class
loc:@layer_3/biases3*
_output_shapes	
:�
�
.train/layer_3/biases3/Adam_1/Initializer/zerosConst*
dtype0*
_output_shapes	
:�*"
_class
loc:@layer_3/biases3*
valueB�*    
�
train/layer_3/biases3/Adam_1
VariableV2*
dtype0*
_output_shapes	
:�*
shared_name *"
_class
loc:@layer_3/biases3*
	container *
shape:�
�
#train/layer_3/biases3/Adam_1/AssignAssigntrain/layer_3/biases3/Adam_1.train/layer_3/biases3/Adam_1/Initializer/zeros*
use_locking(*
T0*"
_class
loc:@layer_3/biases3*
validate_shape(*
_output_shapes	
:�
�
!train/layer_3/biases3/Adam_1/readIdentitytrain/layer_3/biases3/Adam_1*
T0*"
_class
loc:@layer_3/biases3*
_output_shapes	
:�
�
=train/layer_4/weights4/Adam/Initializer/zeros/shape_as_tensorConst*
_output_shapes
:*#
_class
loc:@layer_4/weights4*
valueB",  2   *
dtype0
�
3train/layer_4/weights4/Adam/Initializer/zeros/ConstConst*#
_class
loc:@layer_4/weights4*
valueB
 *    *
dtype0*
_output_shapes
: 
�
-train/layer_4/weights4/Adam/Initializer/zerosFill=train/layer_4/weights4/Adam/Initializer/zeros/shape_as_tensor3train/layer_4/weights4/Adam/Initializer/zeros/Const*
_output_shapes
:	�2*
T0*#
_class
loc:@layer_4/weights4*

index_type0
�
train/layer_4/weights4/Adam
VariableV2*
shared_name *#
_class
loc:@layer_4/weights4*
	container *
shape:	�2*
dtype0*
_output_shapes
:	�2
�
"train/layer_4/weights4/Adam/AssignAssigntrain/layer_4/weights4/Adam-train/layer_4/weights4/Adam/Initializer/zeros*
_output_shapes
:	�2*
use_locking(*
T0*#
_class
loc:@layer_4/weights4*
validate_shape(
�
 train/layer_4/weights4/Adam/readIdentitytrain/layer_4/weights4/Adam*
_output_shapes
:	�2*
T0*#
_class
loc:@layer_4/weights4
�
?train/layer_4/weights4/Adam_1/Initializer/zeros/shape_as_tensorConst*
_output_shapes
:*#
_class
loc:@layer_4/weights4*
valueB",  2   *
dtype0
�
5train/layer_4/weights4/Adam_1/Initializer/zeros/ConstConst*
_output_shapes
: *#
_class
loc:@layer_4/weights4*
valueB
 *    *
dtype0
�
/train/layer_4/weights4/Adam_1/Initializer/zerosFill?train/layer_4/weights4/Adam_1/Initializer/zeros/shape_as_tensor5train/layer_4/weights4/Adam_1/Initializer/zeros/Const*
_output_shapes
:	�2*
T0*#
_class
loc:@layer_4/weights4*

index_type0
�
train/layer_4/weights4/Adam_1
VariableV2*
dtype0*
_output_shapes
:	�2*
shared_name *#
_class
loc:@layer_4/weights4*
	container *
shape:	�2
�
$train/layer_4/weights4/Adam_1/AssignAssigntrain/layer_4/weights4/Adam_1/train/layer_4/weights4/Adam_1/Initializer/zeros*
T0*#
_class
loc:@layer_4/weights4*
validate_shape(*
_output_shapes
:	�2*
use_locking(
�
"train/layer_4/weights4/Adam_1/readIdentitytrain/layer_4/weights4/Adam_1*
T0*#
_class
loc:@layer_4/weights4*
_output_shapes
:	�2
�
,train/layer_4/biases4/Adam/Initializer/zerosConst*"
_class
loc:@layer_4/biases4*
valueB2*    *
dtype0*
_output_shapes
:2
�
train/layer_4/biases4/Adam
VariableV2*
_output_shapes
:2*
shared_name *"
_class
loc:@layer_4/biases4*
	container *
shape:2*
dtype0
�
!train/layer_4/biases4/Adam/AssignAssigntrain/layer_4/biases4/Adam,train/layer_4/biases4/Adam/Initializer/zeros*
use_locking(*
T0*"
_class
loc:@layer_4/biases4*
validate_shape(*
_output_shapes
:2
�
train/layer_4/biases4/Adam/readIdentitytrain/layer_4/biases4/Adam*
T0*"
_class
loc:@layer_4/biases4*
_output_shapes
:2
�
.train/layer_4/biases4/Adam_1/Initializer/zerosConst*"
_class
loc:@layer_4/biases4*
valueB2*    *
dtype0*
_output_shapes
:2
�
train/layer_4/biases4/Adam_1
VariableV2*
shape:2*
dtype0*
_output_shapes
:2*
shared_name *"
_class
loc:@layer_4/biases4*
	container 
�
#train/layer_4/biases4/Adam_1/AssignAssigntrain/layer_4/biases4/Adam_1.train/layer_4/biases4/Adam_1/Initializer/zeros*
use_locking(*
T0*"
_class
loc:@layer_4/biases4*
validate_shape(*
_output_shapes
:2
�
!train/layer_4/biases4/Adam_1/readIdentitytrain/layer_4/biases4/Adam_1*
T0*"
_class
loc:@layer_4/biases4*
_output_shapes
:2
�
,train/output/weights5/Adam/Initializer/zerosConst*
_output_shapes

:2*"
_class
loc:@output/weights5*
valueB2*    *
dtype0
�
train/output/weights5/Adam
VariableV2*
dtype0*
_output_shapes

:2*
shared_name *"
_class
loc:@output/weights5*
	container *
shape
:2
�
!train/output/weights5/Adam/AssignAssigntrain/output/weights5/Adam,train/output/weights5/Adam/Initializer/zeros*"
_class
loc:@output/weights5*
validate_shape(*
_output_shapes

:2*
use_locking(*
T0
�
train/output/weights5/Adam/readIdentitytrain/output/weights5/Adam*
T0*"
_class
loc:@output/weights5*
_output_shapes

:2
�
.train/output/weights5/Adam_1/Initializer/zerosConst*
_output_shapes

:2*"
_class
loc:@output/weights5*
valueB2*    *
dtype0
�
train/output/weights5/Adam_1
VariableV2*
_output_shapes

:2*
shared_name *"
_class
loc:@output/weights5*
	container *
shape
:2*
dtype0
�
#train/output/weights5/Adam_1/AssignAssigntrain/output/weights5/Adam_1.train/output/weights5/Adam_1/Initializer/zeros*
use_locking(*
T0*"
_class
loc:@output/weights5*
validate_shape(*
_output_shapes

:2
�
!train/output/weights5/Adam_1/readIdentitytrain/output/weights5/Adam_1*
T0*"
_class
loc:@output/weights5*
_output_shapes

:2
�
+train/output/biases5/Adam/Initializer/zerosConst*!
_class
loc:@output/biases5*
valueB*    *
dtype0*
_output_shapes
:
�
train/output/biases5/Adam
VariableV2*
dtype0*
_output_shapes
:*
shared_name *!
_class
loc:@output/biases5*
	container *
shape:
�
 train/output/biases5/Adam/AssignAssigntrain/output/biases5/Adam+train/output/biases5/Adam/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@output/biases5*
validate_shape(*
_output_shapes
:
�
train/output/biases5/Adam/readIdentitytrain/output/biases5/Adam*
_output_shapes
:*
T0*!
_class
loc:@output/biases5
�
-train/output/biases5/Adam_1/Initializer/zerosConst*!
_class
loc:@output/biases5*
valueB*    *
dtype0*
_output_shapes
:
�
train/output/biases5/Adam_1
VariableV2*
_output_shapes
:*
shared_name *!
_class
loc:@output/biases5*
	container *
shape:*
dtype0
�
"train/output/biases5/Adam_1/AssignAssigntrain/output/biases5/Adam_1-train/output/biases5/Adam_1/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@output/biases5*
validate_shape(*
_output_shapes
:
�
 train/output/biases5/Adam_1/readIdentitytrain/output/biases5/Adam_1*
T0*!
_class
loc:@output/biases5*
_output_shapes
:
]
train/Adam/learning_rateConst*
valueB
 *o�:*
dtype0*
_output_shapes
: 
U
train/Adam/beta1Const*
valueB
 *fff?*
dtype0*
_output_shapes
: 
U
train/Adam/beta2Const*
valueB
 *w�?*
dtype0*
_output_shapes
: 
W
train/Adam/epsilonConst*
_output_shapes
: *
valueB
 *w�+2*
dtype0
�
,train/Adam/update_layer_1/weights1/ApplyAdam	ApplyAdamlayer_1/weights1train/layer_1/weights1/Adamtrain/layer_1/weights1/Adam_1train/beta1_power/readtrain/beta2_power/readtrain/Adam/learning_ratetrain/Adam/beta1train/Adam/beta2train/Adam/epsilon>train/gradients/layer_1/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*#
_class
loc:@layer_1/weights1*
use_nesterov( *
_output_shapes

:2
�
+train/Adam/update_layer_1/biases1/ApplyAdam	ApplyAdamlayer_1/biases1train/layer_1/biases1/Adamtrain/layer_1/biases1/Adam_1train/beta1_power/readtrain/beta2_power/readtrain/Adam/learning_ratetrain/Adam/beta1train/Adam/beta2train/Adam/epsilon;train/gradients/layer_1/add_grad/tuple/control_dependency_1*
use_locking( *
T0*"
_class
loc:@layer_1/biases1*
use_nesterov( *
_output_shapes
:2
�
,train/Adam/update_layer_2/weights2/ApplyAdam	ApplyAdamlayer_2/weights2train/layer_2/weights2/Adamtrain/layer_2/weights2/Adam_1train/beta1_power/readtrain/beta2_power/readtrain/Adam/learning_ratetrain/Adam/beta1train/Adam/beta2train/Adam/epsilon>train/gradients/layer_2/MatMul_grad/tuple/control_dependency_1*
_output_shapes
:	2�*
use_locking( *
T0*#
_class
loc:@layer_2/weights2*
use_nesterov( 
�
+train/Adam/update_layer_2/biases2/ApplyAdam	ApplyAdamlayer_2/biases2train/layer_2/biases2/Adamtrain/layer_2/biases2/Adam_1train/beta1_power/readtrain/beta2_power/readtrain/Adam/learning_ratetrain/Adam/beta1train/Adam/beta2train/Adam/epsilon;train/gradients/layer_2/add_grad/tuple/control_dependency_1*
use_locking( *
T0*"
_class
loc:@layer_2/biases2*
use_nesterov( *
_output_shapes	
:�
�
,train/Adam/update_layer_3/weights3/ApplyAdam	ApplyAdamlayer_3/weights3train/layer_3/weights3/Adamtrain/layer_3/weights3/Adam_1train/beta1_power/readtrain/beta2_power/readtrain/Adam/learning_ratetrain/Adam/beta1train/Adam/beta2train/Adam/epsilon>train/gradients/layer_3/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*#
_class
loc:@layer_3/weights3*
use_nesterov( * 
_output_shapes
:
��
�
+train/Adam/update_layer_3/biases3/ApplyAdam	ApplyAdamlayer_3/biases3train/layer_3/biases3/Adamtrain/layer_3/biases3/Adam_1train/beta1_power/readtrain/beta2_power/readtrain/Adam/learning_ratetrain/Adam/beta1train/Adam/beta2train/Adam/epsilon;train/gradients/layer_3/add_grad/tuple/control_dependency_1*
use_locking( *
T0*"
_class
loc:@layer_3/biases3*
use_nesterov( *
_output_shapes	
:�
�
,train/Adam/update_layer_4/weights4/ApplyAdam	ApplyAdamlayer_4/weights4train/layer_4/weights4/Adamtrain/layer_4/weights4/Adam_1train/beta1_power/readtrain/beta2_power/readtrain/Adam/learning_ratetrain/Adam/beta1train/Adam/beta2train/Adam/epsilon>train/gradients/layer_4/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*#
_class
loc:@layer_4/weights4*
use_nesterov( *
_output_shapes
:	�2
�
+train/Adam/update_layer_4/biases4/ApplyAdam	ApplyAdamlayer_4/biases4train/layer_4/biases4/Adamtrain/layer_4/biases4/Adam_1train/beta1_power/readtrain/beta2_power/readtrain/Adam/learning_ratetrain/Adam/beta1train/Adam/beta2train/Adam/epsilon;train/gradients/layer_4/add_grad/tuple/control_dependency_1*
use_locking( *
T0*"
_class
loc:@layer_4/biases4*
use_nesterov( *
_output_shapes
:2
�
+train/Adam/update_output/weights5/ApplyAdam	ApplyAdamoutput/weights5train/output/weights5/Adamtrain/output/weights5/Adam_1train/beta1_power/readtrain/beta2_power/readtrain/Adam/learning_ratetrain/Adam/beta1train/Adam/beta2train/Adam/epsilon=train/gradients/output/MatMul_grad/tuple/control_dependency_1*
_output_shapes

:2*
use_locking( *
T0*"
_class
loc:@output/weights5*
use_nesterov( 
�
*train/Adam/update_output/biases5/ApplyAdam	ApplyAdamoutput/biases5train/output/biases5/Adamtrain/output/biases5/Adam_1train/beta1_power/readtrain/beta2_power/readtrain/Adam/learning_ratetrain/Adam/beta1train/Adam/beta2train/Adam/epsilon:train/gradients/output/add_grad/tuple/control_dependency_1*
use_locking( *
T0*!
_class
loc:@output/biases5*
use_nesterov( *
_output_shapes
:
�
train/Adam/mulMultrain/beta1_power/readtrain/Adam/beta1,^train/Adam/update_layer_1/biases1/ApplyAdam-^train/Adam/update_layer_1/weights1/ApplyAdam,^train/Adam/update_layer_2/biases2/ApplyAdam-^train/Adam/update_layer_2/weights2/ApplyAdam,^train/Adam/update_layer_3/biases3/ApplyAdam-^train/Adam/update_layer_3/weights3/ApplyAdam,^train/Adam/update_layer_4/biases4/ApplyAdam-^train/Adam/update_layer_4/weights4/ApplyAdam+^train/Adam/update_output/biases5/ApplyAdam,^train/Adam/update_output/weights5/ApplyAdam*
T0*"
_class
loc:@layer_1/biases1*
_output_shapes
: 
�
train/Adam/AssignAssigntrain/beta1_powertrain/Adam/mul*
_output_shapes
: *
use_locking( *
T0*"
_class
loc:@layer_1/biases1*
validate_shape(
�
train/Adam/mul_1Multrain/beta2_power/readtrain/Adam/beta2,^train/Adam/update_layer_1/biases1/ApplyAdam-^train/Adam/update_layer_1/weights1/ApplyAdam,^train/Adam/update_layer_2/biases2/ApplyAdam-^train/Adam/update_layer_2/weights2/ApplyAdam,^train/Adam/update_layer_3/biases3/ApplyAdam-^train/Adam/update_layer_3/weights3/ApplyAdam,^train/Adam/update_layer_4/biases4/ApplyAdam-^train/Adam/update_layer_4/weights4/ApplyAdam+^train/Adam/update_output/biases5/ApplyAdam,^train/Adam/update_output/weights5/ApplyAdam*
T0*"
_class
loc:@layer_1/biases1*
_output_shapes
: 
�
train/Adam/Assign_1Assigntrain/beta2_powertrain/Adam/mul_1*
use_locking( *
T0*"
_class
loc:@layer_1/biases1*
validate_shape(*
_output_shapes
: 
�

train/AdamNoOp^train/Adam/Assign^train/Adam/Assign_1,^train/Adam/update_layer_1/biases1/ApplyAdam-^train/Adam/update_layer_1/weights1/ApplyAdam,^train/Adam/update_layer_2/biases2/ApplyAdam-^train/Adam/update_layer_2/weights2/ApplyAdam,^train/Adam/update_layer_3/biases3/ApplyAdam-^train/Adam/update_layer_3/weights3/ApplyAdam,^train/Adam/update_layer_4/biases4/ApplyAdam-^train/Adam/update_layer_4/weights4/ApplyAdam+^train/Adam/update_output/biases5/ApplyAdam,^train/Adam/update_output/weights5/ApplyAdam
P

save/ConstConst*
dtype0*
_output_shapes
: *
valueB Bmodel
�
save/SaveV2/tensor_namesConst*�
value�B� Blayer_1/biases1Blayer_1/weights1Blayer_2/biases2Blayer_2/weights2Blayer_3/biases3Blayer_3/weights3Blayer_4/biases4Blayer_4/weights4Boutput/biases5Boutput/weights5Btrain/beta1_powerBtrain/beta2_powerBtrain/layer_1/biases1/AdamBtrain/layer_1/biases1/Adam_1Btrain/layer_1/weights1/AdamBtrain/layer_1/weights1/Adam_1Btrain/layer_2/biases2/AdamBtrain/layer_2/biases2/Adam_1Btrain/layer_2/weights2/AdamBtrain/layer_2/weights2/Adam_1Btrain/layer_3/biases3/AdamBtrain/layer_3/biases3/Adam_1Btrain/layer_3/weights3/AdamBtrain/layer_3/weights3/Adam_1Btrain/layer_4/biases4/AdamBtrain/layer_4/biases4/Adam_1Btrain/layer_4/weights4/AdamBtrain/layer_4/weights4/Adam_1Btrain/output/biases5/AdamBtrain/output/biases5/Adam_1Btrain/output/weights5/AdamBtrain/output/weights5/Adam_1*
dtype0*
_output_shapes
: 
�
save/SaveV2/shape_and_slicesConst*S
valueJBH B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
: 
�
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_sliceslayer_1/biases1layer_1/weights1layer_2/biases2layer_2/weights2layer_3/biases3layer_3/weights3layer_4/biases4layer_4/weights4output/biases5output/weights5train/beta1_powertrain/beta2_powertrain/layer_1/biases1/Adamtrain/layer_1/biases1/Adam_1train/layer_1/weights1/Adamtrain/layer_1/weights1/Adam_1train/layer_2/biases2/Adamtrain/layer_2/biases2/Adam_1train/layer_2/weights2/Adamtrain/layer_2/weights2/Adam_1train/layer_3/biases3/Adamtrain/layer_3/biases3/Adam_1train/layer_3/weights3/Adamtrain/layer_3/weights3/Adam_1train/layer_4/biases4/Adamtrain/layer_4/biases4/Adam_1train/layer_4/weights4/Adamtrain/layer_4/weights4/Adam_1train/output/biases5/Adamtrain/output/biases5/Adam_1train/output/weights5/Adamtrain/output/weights5/Adam_1*.
dtypes$
"2 
}
save/control_dependencyIdentity
save/Const^save/SaveV2*
_output_shapes
: *
T0*
_class
loc:@save/Const
�
save/RestoreV2/tensor_namesConst"/device:CPU:0*�
value�B� Blayer_1/biases1Blayer_1/weights1Blayer_2/biases2Blayer_2/weights2Blayer_3/biases3Blayer_3/weights3Blayer_4/biases4Blayer_4/weights4Boutput/biases5Boutput/weights5Btrain/beta1_powerBtrain/beta2_powerBtrain/layer_1/biases1/AdamBtrain/layer_1/biases1/Adam_1Btrain/layer_1/weights1/AdamBtrain/layer_1/weights1/Adam_1Btrain/layer_2/biases2/AdamBtrain/layer_2/biases2/Adam_1Btrain/layer_2/weights2/AdamBtrain/layer_2/weights2/Adam_1Btrain/layer_3/biases3/AdamBtrain/layer_3/biases3/Adam_1Btrain/layer_3/weights3/AdamBtrain/layer_3/weights3/Adam_1Btrain/layer_4/biases4/AdamBtrain/layer_4/biases4/Adam_1Btrain/layer_4/weights4/AdamBtrain/layer_4/weights4/Adam_1Btrain/output/biases5/AdamBtrain/output/biases5/Adam_1Btrain/output/weights5/AdamBtrain/output/weights5/Adam_1*
dtype0*
_output_shapes
: 
�
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*S
valueJBH B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
: 
�
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*�
_output_shapes�
�::::::::::::::::::::::::::::::::*.
dtypes$
"2 
�
save/AssignAssignlayer_1/biases1save/RestoreV2*
T0*"
_class
loc:@layer_1/biases1*
validate_shape(*
_output_shapes
:2*
use_locking(
�
save/Assign_1Assignlayer_1/weights1save/RestoreV2:1*
T0*#
_class
loc:@layer_1/weights1*
validate_shape(*
_output_shapes

:2*
use_locking(
�
save/Assign_2Assignlayer_2/biases2save/RestoreV2:2*
use_locking(*
T0*"
_class
loc:@layer_2/biases2*
validate_shape(*
_output_shapes	
:�
�
save/Assign_3Assignlayer_2/weights2save/RestoreV2:3*#
_class
loc:@layer_2/weights2*
validate_shape(*
_output_shapes
:	2�*
use_locking(*
T0
�
save/Assign_4Assignlayer_3/biases3save/RestoreV2:4*"
_class
loc:@layer_3/biases3*
validate_shape(*
_output_shapes	
:�*
use_locking(*
T0
�
save/Assign_5Assignlayer_3/weights3save/RestoreV2:5* 
_output_shapes
:
��*
use_locking(*
T0*#
_class
loc:@layer_3/weights3*
validate_shape(
�
save/Assign_6Assignlayer_4/biases4save/RestoreV2:6*
use_locking(*
T0*"
_class
loc:@layer_4/biases4*
validate_shape(*
_output_shapes
:2
�
save/Assign_7Assignlayer_4/weights4save/RestoreV2:7*#
_class
loc:@layer_4/weights4*
validate_shape(*
_output_shapes
:	�2*
use_locking(*
T0
�
save/Assign_8Assignoutput/biases5save/RestoreV2:8*!
_class
loc:@output/biases5*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save/Assign_9Assignoutput/weights5save/RestoreV2:9*"
_class
loc:@output/weights5*
validate_shape(*
_output_shapes

:2*
use_locking(*
T0
�
save/Assign_10Assigntrain/beta1_powersave/RestoreV2:10*
use_locking(*
T0*"
_class
loc:@layer_1/biases1*
validate_shape(*
_output_shapes
: 
�
save/Assign_11Assigntrain/beta2_powersave/RestoreV2:11*
use_locking(*
T0*"
_class
loc:@layer_1/biases1*
validate_shape(*
_output_shapes
: 
�
save/Assign_12Assigntrain/layer_1/biases1/Adamsave/RestoreV2:12*
use_locking(*
T0*"
_class
loc:@layer_1/biases1*
validate_shape(*
_output_shapes
:2
�
save/Assign_13Assigntrain/layer_1/biases1/Adam_1save/RestoreV2:13*
T0*"
_class
loc:@layer_1/biases1*
validate_shape(*
_output_shapes
:2*
use_locking(
�
save/Assign_14Assigntrain/layer_1/weights1/Adamsave/RestoreV2:14*#
_class
loc:@layer_1/weights1*
validate_shape(*
_output_shapes

:2*
use_locking(*
T0
�
save/Assign_15Assigntrain/layer_1/weights1/Adam_1save/RestoreV2:15*
use_locking(*
T0*#
_class
loc:@layer_1/weights1*
validate_shape(*
_output_shapes

:2
�
save/Assign_16Assigntrain/layer_2/biases2/Adamsave/RestoreV2:16*
T0*"
_class
loc:@layer_2/biases2*
validate_shape(*
_output_shapes	
:�*
use_locking(
�
save/Assign_17Assigntrain/layer_2/biases2/Adam_1save/RestoreV2:17*
use_locking(*
T0*"
_class
loc:@layer_2/biases2*
validate_shape(*
_output_shapes	
:�
�
save/Assign_18Assigntrain/layer_2/weights2/Adamsave/RestoreV2:18*
use_locking(*
T0*#
_class
loc:@layer_2/weights2*
validate_shape(*
_output_shapes
:	2�
�
save/Assign_19Assigntrain/layer_2/weights2/Adam_1save/RestoreV2:19*
use_locking(*
T0*#
_class
loc:@layer_2/weights2*
validate_shape(*
_output_shapes
:	2�
�
save/Assign_20Assigntrain/layer_3/biases3/Adamsave/RestoreV2:20*
_output_shapes	
:�*
use_locking(*
T0*"
_class
loc:@layer_3/biases3*
validate_shape(
�
save/Assign_21Assigntrain/layer_3/biases3/Adam_1save/RestoreV2:21*
T0*"
_class
loc:@layer_3/biases3*
validate_shape(*
_output_shapes	
:�*
use_locking(
�
save/Assign_22Assigntrain/layer_3/weights3/Adamsave/RestoreV2:22* 
_output_shapes
:
��*
use_locking(*
T0*#
_class
loc:@layer_3/weights3*
validate_shape(
�
save/Assign_23Assigntrain/layer_3/weights3/Adam_1save/RestoreV2:23*
validate_shape(* 
_output_shapes
:
��*
use_locking(*
T0*#
_class
loc:@layer_3/weights3
�
save/Assign_24Assigntrain/layer_4/biases4/Adamsave/RestoreV2:24*
T0*"
_class
loc:@layer_4/biases4*
validate_shape(*
_output_shapes
:2*
use_locking(
�
save/Assign_25Assigntrain/layer_4/biases4/Adam_1save/RestoreV2:25*"
_class
loc:@layer_4/biases4*
validate_shape(*
_output_shapes
:2*
use_locking(*
T0
�
save/Assign_26Assigntrain/layer_4/weights4/Adamsave/RestoreV2:26*
use_locking(*
T0*#
_class
loc:@layer_4/weights4*
validate_shape(*
_output_shapes
:	�2
�
save/Assign_27Assigntrain/layer_4/weights4/Adam_1save/RestoreV2:27*
_output_shapes
:	�2*
use_locking(*
T0*#
_class
loc:@layer_4/weights4*
validate_shape(
�
save/Assign_28Assigntrain/output/biases5/Adamsave/RestoreV2:28*
_output_shapes
:*
use_locking(*
T0*!
_class
loc:@output/biases5*
validate_shape(
�
save/Assign_29Assigntrain/output/biases5/Adam_1save/RestoreV2:29*
use_locking(*
T0*!
_class
loc:@output/biases5*
validate_shape(*
_output_shapes
:
�
save/Assign_30Assigntrain/output/weights5/Adamsave/RestoreV2:30*
use_locking(*
T0*"
_class
loc:@output/weights5*
validate_shape(*
_output_shapes

:2
�
save/Assign_31Assigntrain/output/weights5/Adam_1save/RestoreV2:31*
use_locking(*
T0*"
_class
loc:@output/weights5*
validate_shape(*
_output_shapes

:2
�
save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_2^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_23^save/Assign_24^save/Assign_25^save/Assign_26^save/Assign_27^save/Assign_28^save/Assign_29^save/Assign_3^save/Assign_30^save/Assign_31^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9
�
initNoOp^layer_1/biases1/Assign^layer_1/weights1/Assign^layer_2/biases2/Assign^layer_2/weights2/Assign^layer_3/biases3/Assign^layer_3/weights3/Assign^layer_4/biases4/Assign^layer_4/weights4/Assign^output/biases5/Assign^output/weights5/Assign^train/beta1_power/Assign^train/beta2_power/Assign"^train/layer_1/biases1/Adam/Assign$^train/layer_1/biases1/Adam_1/Assign#^train/layer_1/weights1/Adam/Assign%^train/layer_1/weights1/Adam_1/Assign"^train/layer_2/biases2/Adam/Assign$^train/layer_2/biases2/Adam_1/Assign#^train/layer_2/weights2/Adam/Assign%^train/layer_2/weights2/Adam_1/Assign"^train/layer_3/biases3/Adam/Assign$^train/layer_3/biases3/Adam_1/Assign#^train/layer_3/weights3/Adam/Assign%^train/layer_3/weights3/Adam_1/Assign"^train/layer_4/biases4/Adam/Assign$^train/layer_4/biases4/Adam_1/Assign#^train/layer_4/weights4/Adam/Assign%^train/layer_4/weights4/Adam_1/Assign!^train/output/biases5/Adam/Assign#^train/output/biases5/Adam_1/Assign"^train/output/weights5/Adam/Assign$^train/output/weights5/Adam_1/Assign
R
save_1/ConstConst*
dtype0*
_output_shapes
: *
valueB Bmodel
�
save_1/StringJoin/inputs_1Const*<
value3B1 B+_temp_79e5a4a5ed0642dca3ef4e385aef085d/part*
dtype0*
_output_shapes
: 
{
save_1/StringJoin
StringJoinsave_1/Constsave_1/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
S
save_1/num_shardsConst*
_output_shapes
: *
value	B :*
dtype0
m
save_1/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
�
save_1/ShardedFilenameShardedFilenamesave_1/StringJoinsave_1/ShardedFilename/shardsave_1/num_shards"/device:CPU:0*
_output_shapes
: 
�
save_1/SaveV2/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
: *�
value�B� Blayer_1/biases1Blayer_1/weights1Blayer_2/biases2Blayer_2/weights2Blayer_3/biases3Blayer_3/weights3Blayer_4/biases4Blayer_4/weights4Boutput/biases5Boutput/weights5Btrain/beta1_powerBtrain/beta2_powerBtrain/layer_1/biases1/AdamBtrain/layer_1/biases1/Adam_1Btrain/layer_1/weights1/AdamBtrain/layer_1/weights1/Adam_1Btrain/layer_2/biases2/AdamBtrain/layer_2/biases2/Adam_1Btrain/layer_2/weights2/AdamBtrain/layer_2/weights2/Adam_1Btrain/layer_3/biases3/AdamBtrain/layer_3/biases3/Adam_1Btrain/layer_3/weights3/AdamBtrain/layer_3/weights3/Adam_1Btrain/layer_4/biases4/AdamBtrain/layer_4/biases4/Adam_1Btrain/layer_4/weights4/AdamBtrain/layer_4/weights4/Adam_1Btrain/output/biases5/AdamBtrain/output/biases5/Adam_1Btrain/output/weights5/AdamBtrain/output/weights5/Adam_1
�
save_1/SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
: *S
valueJBH B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
�
save_1/SaveV2SaveV2save_1/ShardedFilenamesave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_sliceslayer_1/biases1layer_1/weights1layer_2/biases2layer_2/weights2layer_3/biases3layer_3/weights3layer_4/biases4layer_4/weights4output/biases5output/weights5train/beta1_powertrain/beta2_powertrain/layer_1/biases1/Adamtrain/layer_1/biases1/Adam_1train/layer_1/weights1/Adamtrain/layer_1/weights1/Adam_1train/layer_2/biases2/Adamtrain/layer_2/biases2/Adam_1train/layer_2/weights2/Adamtrain/layer_2/weights2/Adam_1train/layer_3/biases3/Adamtrain/layer_3/biases3/Adam_1train/layer_3/weights3/Adamtrain/layer_3/weights3/Adam_1train/layer_4/biases4/Adamtrain/layer_4/biases4/Adam_1train/layer_4/weights4/Adamtrain/layer_4/weights4/Adam_1train/output/biases5/Adamtrain/output/biases5/Adam_1train/output/weights5/Adamtrain/output/weights5/Adam_1"/device:CPU:0*.
dtypes$
"2 
�
save_1/control_dependencyIdentitysave_1/ShardedFilename^save_1/SaveV2"/device:CPU:0*
T0*)
_class
loc:@save_1/ShardedFilename*
_output_shapes
: 
�
-save_1/MergeV2Checkpoints/checkpoint_prefixesPacksave_1/ShardedFilename^save_1/control_dependency"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:
�
save_1/MergeV2CheckpointsMergeV2Checkpoints-save_1/MergeV2Checkpoints/checkpoint_prefixessave_1/Const"/device:CPU:0*
delete_old_dirs(
�
save_1/IdentityIdentitysave_1/Const^save_1/MergeV2Checkpoints^save_1/control_dependency"/device:CPU:0*
T0*
_output_shapes
: 
�
save_1/RestoreV2/tensor_namesConst"/device:CPU:0*�
value�B� Blayer_1/biases1Blayer_1/weights1Blayer_2/biases2Blayer_2/weights2Blayer_3/biases3Blayer_3/weights3Blayer_4/biases4Blayer_4/weights4Boutput/biases5Boutput/weights5Btrain/beta1_powerBtrain/beta2_powerBtrain/layer_1/biases1/AdamBtrain/layer_1/biases1/Adam_1Btrain/layer_1/weights1/AdamBtrain/layer_1/weights1/Adam_1Btrain/layer_2/biases2/AdamBtrain/layer_2/biases2/Adam_1Btrain/layer_2/weights2/AdamBtrain/layer_2/weights2/Adam_1Btrain/layer_3/biases3/AdamBtrain/layer_3/biases3/Adam_1Btrain/layer_3/weights3/AdamBtrain/layer_3/weights3/Adam_1Btrain/layer_4/biases4/AdamBtrain/layer_4/biases4/Adam_1Btrain/layer_4/weights4/AdamBtrain/layer_4/weights4/Adam_1Btrain/output/biases5/AdamBtrain/output/biases5/Adam_1Btrain/output/weights5/AdamBtrain/output/weights5/Adam_1*
dtype0*
_output_shapes
: 
�
!save_1/RestoreV2/shape_and_slicesConst"/device:CPU:0*S
valueJBH B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
: 
�
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices"/device:CPU:0*�
_output_shapes�
�::::::::::::::::::::::::::::::::*.
dtypes$
"2 
�
save_1/AssignAssignlayer_1/biases1save_1/RestoreV2*
validate_shape(*
_output_shapes
:2*
use_locking(*
T0*"
_class
loc:@layer_1/biases1
�
save_1/Assign_1Assignlayer_1/weights1save_1/RestoreV2:1*
use_locking(*
T0*#
_class
loc:@layer_1/weights1*
validate_shape(*
_output_shapes

:2
�
save_1/Assign_2Assignlayer_2/biases2save_1/RestoreV2:2*
use_locking(*
T0*"
_class
loc:@layer_2/biases2*
validate_shape(*
_output_shapes	
:�
�
save_1/Assign_3Assignlayer_2/weights2save_1/RestoreV2:3*#
_class
loc:@layer_2/weights2*
validate_shape(*
_output_shapes
:	2�*
use_locking(*
T0
�
save_1/Assign_4Assignlayer_3/biases3save_1/RestoreV2:4*"
_class
loc:@layer_3/biases3*
validate_shape(*
_output_shapes	
:�*
use_locking(*
T0
�
save_1/Assign_5Assignlayer_3/weights3save_1/RestoreV2:5*
use_locking(*
T0*#
_class
loc:@layer_3/weights3*
validate_shape(* 
_output_shapes
:
��
�
save_1/Assign_6Assignlayer_4/biases4save_1/RestoreV2:6*
_output_shapes
:2*
use_locking(*
T0*"
_class
loc:@layer_4/biases4*
validate_shape(
�
save_1/Assign_7Assignlayer_4/weights4save_1/RestoreV2:7*
T0*#
_class
loc:@layer_4/weights4*
validate_shape(*
_output_shapes
:	�2*
use_locking(
�
save_1/Assign_8Assignoutput/biases5save_1/RestoreV2:8*!
_class
loc:@output/biases5*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_1/Assign_9Assignoutput/weights5save_1/RestoreV2:9*
use_locking(*
T0*"
_class
loc:@output/weights5*
validate_shape(*
_output_shapes

:2
�
save_1/Assign_10Assigntrain/beta1_powersave_1/RestoreV2:10*
_output_shapes
: *
use_locking(*
T0*"
_class
loc:@layer_1/biases1*
validate_shape(
�
save_1/Assign_11Assigntrain/beta2_powersave_1/RestoreV2:11*
_output_shapes
: *
use_locking(*
T0*"
_class
loc:@layer_1/biases1*
validate_shape(
�
save_1/Assign_12Assigntrain/layer_1/biases1/Adamsave_1/RestoreV2:12*
validate_shape(*
_output_shapes
:2*
use_locking(*
T0*"
_class
loc:@layer_1/biases1
�
save_1/Assign_13Assigntrain/layer_1/biases1/Adam_1save_1/RestoreV2:13*
_output_shapes
:2*
use_locking(*
T0*"
_class
loc:@layer_1/biases1*
validate_shape(
�
save_1/Assign_14Assigntrain/layer_1/weights1/Adamsave_1/RestoreV2:14*
use_locking(*
T0*#
_class
loc:@layer_1/weights1*
validate_shape(*
_output_shapes

:2
�
save_1/Assign_15Assigntrain/layer_1/weights1/Adam_1save_1/RestoreV2:15*#
_class
loc:@layer_1/weights1*
validate_shape(*
_output_shapes

:2*
use_locking(*
T0
�
save_1/Assign_16Assigntrain/layer_2/biases2/Adamsave_1/RestoreV2:16*
_output_shapes	
:�*
use_locking(*
T0*"
_class
loc:@layer_2/biases2*
validate_shape(
�
save_1/Assign_17Assigntrain/layer_2/biases2/Adam_1save_1/RestoreV2:17*
T0*"
_class
loc:@layer_2/biases2*
validate_shape(*
_output_shapes	
:�*
use_locking(
�
save_1/Assign_18Assigntrain/layer_2/weights2/Adamsave_1/RestoreV2:18*
use_locking(*
T0*#
_class
loc:@layer_2/weights2*
validate_shape(*
_output_shapes
:	2�
�
save_1/Assign_19Assigntrain/layer_2/weights2/Adam_1save_1/RestoreV2:19*#
_class
loc:@layer_2/weights2*
validate_shape(*
_output_shapes
:	2�*
use_locking(*
T0
�
save_1/Assign_20Assigntrain/layer_3/biases3/Adamsave_1/RestoreV2:20*
use_locking(*
T0*"
_class
loc:@layer_3/biases3*
validate_shape(*
_output_shapes	
:�
�
save_1/Assign_21Assigntrain/layer_3/biases3/Adam_1save_1/RestoreV2:21*
use_locking(*
T0*"
_class
loc:@layer_3/biases3*
validate_shape(*
_output_shapes	
:�
�
save_1/Assign_22Assigntrain/layer_3/weights3/Adamsave_1/RestoreV2:22*
use_locking(*
T0*#
_class
loc:@layer_3/weights3*
validate_shape(* 
_output_shapes
:
��
�
save_1/Assign_23Assigntrain/layer_3/weights3/Adam_1save_1/RestoreV2:23*
use_locking(*
T0*#
_class
loc:@layer_3/weights3*
validate_shape(* 
_output_shapes
:
��
�
save_1/Assign_24Assigntrain/layer_4/biases4/Adamsave_1/RestoreV2:24*"
_class
loc:@layer_4/biases4*
validate_shape(*
_output_shapes
:2*
use_locking(*
T0
�
save_1/Assign_25Assigntrain/layer_4/biases4/Adam_1save_1/RestoreV2:25*
T0*"
_class
loc:@layer_4/biases4*
validate_shape(*
_output_shapes
:2*
use_locking(
�
save_1/Assign_26Assigntrain/layer_4/weights4/Adamsave_1/RestoreV2:26*
T0*#
_class
loc:@layer_4/weights4*
validate_shape(*
_output_shapes
:	�2*
use_locking(
�
save_1/Assign_27Assigntrain/layer_4/weights4/Adam_1save_1/RestoreV2:27*
_output_shapes
:	�2*
use_locking(*
T0*#
_class
loc:@layer_4/weights4*
validate_shape(
�
save_1/Assign_28Assigntrain/output/biases5/Adamsave_1/RestoreV2:28*
use_locking(*
T0*!
_class
loc:@output/biases5*
validate_shape(*
_output_shapes
:
�
save_1/Assign_29Assigntrain/output/biases5/Adam_1save_1/RestoreV2:29*
T0*!
_class
loc:@output/biases5*
validate_shape(*
_output_shapes
:*
use_locking(
�
save_1/Assign_30Assigntrain/output/weights5/Adamsave_1/RestoreV2:30*
T0*"
_class
loc:@output/weights5*
validate_shape(*
_output_shapes

:2*
use_locking(
�
save_1/Assign_31Assigntrain/output/weights5/Adam_1save_1/RestoreV2:31*
validate_shape(*
_output_shapes

:2*
use_locking(*
T0*"
_class
loc:@output/weights5
�
save_1/restore_shardNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_10^save_1/Assign_11^save_1/Assign_12^save_1/Assign_13^save_1/Assign_14^save_1/Assign_15^save_1/Assign_16^save_1/Assign_17^save_1/Assign_18^save_1/Assign_19^save_1/Assign_2^save_1/Assign_20^save_1/Assign_21^save_1/Assign_22^save_1/Assign_23^save_1/Assign_24^save_1/Assign_25^save_1/Assign_26^save_1/Assign_27^save_1/Assign_28^save_1/Assign_29^save_1/Assign_3^save_1/Assign_30^save_1/Assign_31^save_1/Assign_4^save_1/Assign_5^save_1/Assign_6^save_1/Assign_7^save_1/Assign_8^save_1/Assign_9
1
save_1/restore_allNoOp^save_1/restore_shard"B
save_1/Const:0save_1/Identity:0save_1/restore_all (5 @F8"�#
	variables�#�#
w
layer_1/weights1:0layer_1/weights1/Assignlayer_1/weights1/read:02-layer_1/weights1/Initializer/random_uniform:08
j
layer_1/biases1:0layer_1/biases1/Assignlayer_1/biases1/read:02#layer_1/biases1/Initializer/zeros:08
w
layer_2/weights2:0layer_2/weights2/Assignlayer_2/weights2/read:02-layer_2/weights2/Initializer/random_uniform:08
j
layer_2/biases2:0layer_2/biases2/Assignlayer_2/biases2/read:02#layer_2/biases2/Initializer/zeros:08
w
layer_3/weights3:0layer_3/weights3/Assignlayer_3/weights3/read:02-layer_3/weights3/Initializer/random_uniform:08
j
layer_3/biases3:0layer_3/biases3/Assignlayer_3/biases3/read:02#layer_3/biases3/Initializer/zeros:08
w
layer_4/weights4:0layer_4/weights4/Assignlayer_4/weights4/read:02-layer_4/weights4/Initializer/random_uniform:08
j
layer_4/biases4:0layer_4/biases4/Assignlayer_4/biases4/read:02#layer_4/biases4/Initializer/zeros:08
s
output/weights5:0output/weights5/Assignoutput/weights5/read:02,output/weights5/Initializer/random_uniform:08
f
output/biases5:0output/biases5/Assignoutput/biases5/read:02"output/biases5/Initializer/zeros:08
l
train/beta1_power:0train/beta1_power/Assigntrain/beta1_power/read:02!train/beta1_power/initial_value:0
l
train/beta2_power:0train/beta2_power/Assigntrain/beta2_power/read:02!train/beta2_power/initial_value:0
�
train/layer_1/weights1/Adam:0"train/layer_1/weights1/Adam/Assign"train/layer_1/weights1/Adam/read:02/train/layer_1/weights1/Adam/Initializer/zeros:0
�
train/layer_1/weights1/Adam_1:0$train/layer_1/weights1/Adam_1/Assign$train/layer_1/weights1/Adam_1/read:021train/layer_1/weights1/Adam_1/Initializer/zeros:0
�
train/layer_1/biases1/Adam:0!train/layer_1/biases1/Adam/Assign!train/layer_1/biases1/Adam/read:02.train/layer_1/biases1/Adam/Initializer/zeros:0
�
train/layer_1/biases1/Adam_1:0#train/layer_1/biases1/Adam_1/Assign#train/layer_1/biases1/Adam_1/read:020train/layer_1/biases1/Adam_1/Initializer/zeros:0
�
train/layer_2/weights2/Adam:0"train/layer_2/weights2/Adam/Assign"train/layer_2/weights2/Adam/read:02/train/layer_2/weights2/Adam/Initializer/zeros:0
�
train/layer_2/weights2/Adam_1:0$train/layer_2/weights2/Adam_1/Assign$train/layer_2/weights2/Adam_1/read:021train/layer_2/weights2/Adam_1/Initializer/zeros:0
�
train/layer_2/biases2/Adam:0!train/layer_2/biases2/Adam/Assign!train/layer_2/biases2/Adam/read:02.train/layer_2/biases2/Adam/Initializer/zeros:0
�
train/layer_2/biases2/Adam_1:0#train/layer_2/biases2/Adam_1/Assign#train/layer_2/biases2/Adam_1/read:020train/layer_2/biases2/Adam_1/Initializer/zeros:0
�
train/layer_3/weights3/Adam:0"train/layer_3/weights3/Adam/Assign"train/layer_3/weights3/Adam/read:02/train/layer_3/weights3/Adam/Initializer/zeros:0
�
train/layer_3/weights3/Adam_1:0$train/layer_3/weights3/Adam_1/Assign$train/layer_3/weights3/Adam_1/read:021train/layer_3/weights3/Adam_1/Initializer/zeros:0
�
train/layer_3/biases3/Adam:0!train/layer_3/biases3/Adam/Assign!train/layer_3/biases3/Adam/read:02.train/layer_3/biases3/Adam/Initializer/zeros:0
�
train/layer_3/biases3/Adam_1:0#train/layer_3/biases3/Adam_1/Assign#train/layer_3/biases3/Adam_1/read:020train/layer_3/biases3/Adam_1/Initializer/zeros:0
�
train/layer_4/weights4/Adam:0"train/layer_4/weights4/Adam/Assign"train/layer_4/weights4/Adam/read:02/train/layer_4/weights4/Adam/Initializer/zeros:0
�
train/layer_4/weights4/Adam_1:0$train/layer_4/weights4/Adam_1/Assign$train/layer_4/weights4/Adam_1/read:021train/layer_4/weights4/Adam_1/Initializer/zeros:0
�
train/layer_4/biases4/Adam:0!train/layer_4/biases4/Adam/Assign!train/layer_4/biases4/Adam/read:02.train/layer_4/biases4/Adam/Initializer/zeros:0
�
train/layer_4/biases4/Adam_1:0#train/layer_4/biases4/Adam_1/Assign#train/layer_4/biases4/Adam_1/read:020train/layer_4/biases4/Adam_1/Initializer/zeros:0
�
train/output/weights5/Adam:0!train/output/weights5/Adam/Assign!train/output/weights5/Adam/read:02.train/output/weights5/Adam/Initializer/zeros:0
�
train/output/weights5/Adam_1:0#train/output/weights5/Adam_1/Assign#train/output/weights5/Adam_1/read:020train/output/weights5/Adam_1/Initializer/zeros:0
�
train/output/biases5/Adam:0 train/output/biases5/Adam/Assign train/output/biases5/Adam/read:02-train/output/biases5/Adam/Initializer/zeros:0
�
train/output/biases5/Adam_1:0"train/output/biases5/Adam_1/Assign"train/output/biases5/Adam_1/read:02/train/output/biases5/Adam_1/Initializer/zeros:0"�	
trainable_variables��
w
layer_1/weights1:0layer_1/weights1/Assignlayer_1/weights1/read:02-layer_1/weights1/Initializer/random_uniform:08
j
layer_1/biases1:0layer_1/biases1/Assignlayer_1/biases1/read:02#layer_1/biases1/Initializer/zeros:08
w
layer_2/weights2:0layer_2/weights2/Assignlayer_2/weights2/read:02-layer_2/weights2/Initializer/random_uniform:08
j
layer_2/biases2:0layer_2/biases2/Assignlayer_2/biases2/read:02#layer_2/biases2/Initializer/zeros:08
w
layer_3/weights3:0layer_3/weights3/Assignlayer_3/weights3/read:02-layer_3/weights3/Initializer/random_uniform:08
j
layer_3/biases3:0layer_3/biases3/Assignlayer_3/biases3/read:02#layer_3/biases3/Initializer/zeros:08
w
layer_4/weights4:0layer_4/weights4/Assignlayer_4/weights4/read:02-layer_4/weights4/Initializer/random_uniform:08
j
layer_4/biases4:0layer_4/biases4/Assignlayer_4/biases4/read:02#layer_4/biases4/Initializer/zeros:08
s
output/weights5:0output/weights5/Assignoutput/weights5/read:02,output/weights5/Initializer/random_uniform:08
f
output/biases5:0output/biases5/Assignoutput/biases5/read:02"output/biases5/Initializer/zeros:08"
train_op


train/Adam*�
serving_default�
3
input*
input/Placeholder:0���������.
mistake#
output/add:0���������tensorflow/serving/predict