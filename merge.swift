var array = [2, 8, 10, 5, 4, 1, 9, 7, 3, 6]

func merge(array: inout [Int]){

    let arraySize = array.count

    if arraySize > 1{

        var leftArray = Array(array[0..<arraySize/2])
        var rightArray = Array(array[arraySize/2..<arraySize])

        // recursively break down the arrays
        merge(array: &leftArray)
        merge(array: &rightArray)

        // perform the merging
        var leftArrayIndex = 0
        var rightArrayIndex = 0
        var mergedArrayIndex = 0

        // while both arrays have content
        while leftArrayIndex < leftArray.count && rightArrayIndex < rightArray.count{

            if(leftArray[leftArrayIndex] < rightArray[rightArrayIndex]){
                array[mergedArrayIndex] = leftArray[leftArrayIndex]
                leftArrayIndex += 1
            }else{
                array[mergedArrayIndex] = rightArray[rightArrayIndex]
                rightArrayIndex += 1
            }

            mergedArrayIndex += 1

        }

        // while the left array still has values
        while leftArrayIndex < leftArray.count{
            array[mergedArrayIndex] = leftArray[leftArrayIndex]
            leftArrayIndex += 1
            mergedArrayIndex += 1
        }

        // while the right array still has values
        while rightArrayIndex < rightArray.count{
            array[mergedArrayIndex] = rightArray[rightArrayIndex]
            rightArrayIndex += 1
            mergedArrayIndex += 1
        }

    }

}

print("Before: \(array)")
merge(array: &array)
print("After: \(array)")