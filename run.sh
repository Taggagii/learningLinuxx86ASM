# if the user doesn't pass in exactly one parameter tell them the format and throw an error
if [ $# -ne 1 ]; then
    echo "The format to call this command is: ./run.sh [FILENAME]";
    exit 1;
fi

# if the user passes in a file that does not exist, tell them and throw an error
if [ ! -f "$1" ]; then
    echo "File '$1' does not exist";
    exit 1;
fi

extension="${1##*.}"
filename="${1%.*}"

# if the file extension passed in is not '.asm' tell the user and throw an error
if [ $extension != 'asm' ]; then
    echo "The filename must be of type '.asm'";
    exit 1;
fi

# compile the code into an ELF object 
nasm -f elf $1 && \

# link the object file and create an executable
ld -m elf_i386 -s -o $filename "${filename}.o" && \

# clean up the object file 
rm "${filename}.o" && \

# run the code
./$filename

# clean up the executable
rm "$filename"