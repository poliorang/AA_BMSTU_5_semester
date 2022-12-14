//
//  functions.swift
//  lab_03_commandTool
//
//  Created by poliorang on 20.10.2022.
//

import Foundation

func bucketSort(_ array: [Double]) -> [Double]  {
    var resultArray: [Double] = []

    let maxValue = array.max()!
    let minValue = array.min()!
    let lenArray = array.count
    let offset = array.filter { $0 < 0 }.count

    var sizeValue = maxValue / Double(lenArray) as Double
    
    if minValue < 0 { sizeValue = maxValue + (-minValue) / Double(lenArray) as Double }
    
    var buckets: [[Double]] = []
    for _ in 0..<lenArray { buckets.append([]) }
    
    for i in 0..<lenArray {
        let j = Int(array[i] / sizeValue)
        
        if j != lenArray {
            buckets[j + offset].append(array[i])
        } else {
            buckets[lenArray - 1].append(array[i])
        }
    }
    
    for i in 0..<lenArray {
        insertionSort(bucket: &buckets[i])
        resultArray.append(contentsOf: buckets[i])
    }
    
    return resultArray
}

func insertionSort(bucket: inout [Double]) {
    for i in 0..<bucket.count{
        let tmp = bucket[i]
        var j = i - 1
        while (j >= 0 && tmp < bucket[j]) {
            bucket[j + 1] = bucket[j]
            j = j - 1
        }
        bucket[j + 1] = tmp
    }
}

