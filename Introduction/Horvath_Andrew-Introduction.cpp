#include <iostream>
#include <fstream>
#include <limits>

using namespace std;

// Function to compute the average of the integer values in the array.
float Average(int N, int* arr) {
    float sum = 0;
    for (int i = 0; i < N; i++) {
        sum += arr[i];
    }
    return sum / N;
}

int main() {
    // Opening the file "Scores.txt" for reading.
    ifstream inFile("Scores.txt");
    
    if (!inFile.is_open()) {
        cout << "Error: Unable to open file Scores.txt." << endl;
        return 1;
    }

    int N;
    inFile >> N;

    // Check if reading N failed or if N is not positive.
    if (inFile.fail() || N <= 0) {
        cout << "Error: Invalid number of scores in the file." << endl;
        inFile.close();
        return 2;
    }

    int* numbers = new int[N];
    int smallest = numeric_limits<int>::max();
    int largest = numeric_limits<int>::min();

    for (int i = 0; i < N; i++) {
        inFile >> numbers[i];

        // Check if reading a score failed.
        if (inFile.fail()) {
            cout << "Error: Failed to read score number " << (i+1) << "." << endl;
            delete[] numbers;
            inFile.close();
            return 3;
        }

        if (numbers[i] < smallest) {
            smallest = numbers[i];
        }
        if (numbers[i] > largest) {
            largest = numbers[i];
        }
    }

    float avg = Average(N, numbers);

    cout << "Smallest Number: " << smallest << endl;
    cout << "Largest Number: " << largest << endl;
    cout << "Average: " << avg << endl;

    delete[] numbers;
    inFile.close();

    return 0;
}
