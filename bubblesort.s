.text
.global _start

_start: LDR R0, =LIST //load list in R0 and return sorted list in R0. The first item in the list is the # of elements to be sorted
        LDR R4, [R0]
        MOV R7, R0
        ADD R0, #4 //start sorting algorithm from the 2nd item in the list
        MOV R3, #1
        MOV R1, #1
MAIN:   MOV R2, #0 //boolean representing "swapped"
        ADD R1, #1 //increment counter in the outer for loop
        CMP R1, R4 //have we reached the end of the list?
        BEQ M_END //if so, branch to the end 
        B SWAP  //else go to the inner loop
SWAP:   CMP R3, R4
        BEQ L_END 
        LDR R5, [R0, #4] //R5 stores next list item
        LDR R6, [R0]
        ADD R3, #1 //update counter in inner for loop
        CMP R6, R5 //compare current and next
        BGT NO_SWAP  //if order is correct go to no_swap
        STR R5, [R0] //else, swap list items and write to memory
        STR R6, [R0, #4]
        MOV R2, #1 //swapped = true
        ADD R0, #4
        B SWAP  //go to next index in the list
NO_SWAP: ADD R0, #4
        B SWAP
L_END:  CMP R2, #0
        BEQ M_END //if swapped = false, exit
        MOV R2, #0 //else reset "swapped" to false
        MOV R3, #1 //reset the loop counter
        MOV R0, R7
        ADD R0, #4
        B SWAP  //restart inner loop
M_END: B M_END  //done sorting
 
LIST: .word 10, 1400, 45, 23, 5, 3, 8, 17, 4, 20, 33, 130
