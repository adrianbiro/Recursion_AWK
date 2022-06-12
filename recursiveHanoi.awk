# I did this in AWK just because, there is plenty of T.o.H.
# implementations in python, and the AWK version looks more
# compact. And it is easier to write this in another language
# than try to forget pythonic explanation of topic.
function move(f,t){
    print "Move disc from", f, "to",t
    counter++
}

function hanoi(n,f,helper,t){
    if (n == 0){
            ;
    } else {
        hanoi(n-1,f,t,helper)
        move(f,t)
        hanoi(n-1,helper,f,t)
    }
}

BEGIN {
    printf "Enter number of discs to calculate moves: "
    getline num < "-"       # Dash is propper AWKy way to get user input. But it is more cryptic
    hanoi(num,"A","B","C")  # than to specify a device like that "/dev/stdin"
    printf"%s discs in %s moves.\n", num, counter
}


# 23 discs in 8388607 moves.
# 24 discs in 16777215 moves.
# 25 discs in 33554431 moves.
# 27 discs in 134217727 moves.
## moves per disc formula 2^n-1
# $ bc <<< 'define moves(n) {return 2^n - 1}; moves(27);'
# 134217727

# $ awk -f recursiveHanoi.awk
# Enter number of discs to calculate moves: 5
# Move disc from A to C
# Move disc from A to B
# Move disc from C to B
# Move disc from A to C
# Move disc from B to A
# Move disc from B to C
# Move disc from A to C
# Move disc from A to B
# Move disc from C to B
# Move disc from C to A
# Move disc from B to A
# Move disc from C to B
# Move disc from A to C
# Move disc from A to B
# Move disc from C to B
# Move disc from A to C
# Move disc from B to A
# Move disc from B to C
# Move disc from A to C
# Move disc from B to A
# Move disc from C to B
# Move disc from C to A
# Move disc from B to A
# Move disc from B to C
# Move disc from A to C
# Move disc from A to B
# Move disc from C to B
# Move disc from A to C
# Move disc from B to A
# Move disc from B to C
# Move disc from A to C
# 5 discs in 31 moves.

