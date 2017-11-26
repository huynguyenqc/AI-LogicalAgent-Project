SOURCE_PATH="Source"
RELEASE_PATH="Release"
INPUT_FILE_PATH="$SOURCE_PATH/input.txt"

echo "Cleaning all files in $RELEASE_PATH/..."
rm $RELEASE_PATH/*

echo "Compiling Proposition.cpp..."
g++ -Wall -std=gnu++14 -c "$SOURCE_PATH/Proposition.cpp" -o "$RELEASE_PATH/Proposition.o"

echo "Compiling Preprocess.cpp..."
g++ -Wall -std=gnu++14 -c "$SOURCE_PATH/Preprocess.cpp" -o "$RELEASE_PATH/Preprocess.o"

echo "Compiling main.cpp..."
g++ -Wall -std=gnu++14 -c "$SOURCE_PATH/main.cpp" -o "$RELEASE_PATH/main.o"

TEMP_PATH=$PWD

echo "Going to $RELEASE_PATH/..."
cd $RELEASE_PATH

echo "Compiling into execute file..."
g++ -std=gnu++14 -Wall Proposition.o Preprocess.o main.o -o LogicalAgent

echo "Leaving $RELEASE_PATH/..."
cd "$TEMP_PATH"

echo "Copying input file..."
cp $INPUT_FILE_PATH $RELEASE_PATH

echo "Going to $RELEASE_PATH/..."
cd $RELEASE_PATH

echo "Executing..."
./LogicalAgent

echo "Finished running"
echo "Leaving $RELEASE_PATH/"
cd "$TEMP_PATH"