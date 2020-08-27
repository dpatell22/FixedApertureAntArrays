import numpy as np
import math

class AntennaArray:
    def __init__(self):
        self.antennaPos = []
        self.mid = [0,0,0]

    def size(self):
        return len(self.antennaPos)

    def addAntenna(self, coor):
        self.antennaPos.append(coor)
        size = len(self.antennaPos)
        for axis in range(len(coor)):
            self.mid[axis] = (self.mid[axis] * (size - 1) + coor[axis])/size

    # central reference from the array
    def reference(self):
        return self.mid

    def array(self):
        return self.antennaPos
    
    def coordinate(self, index):
        return self.antennaPos[index]

    def normal(self):
        antMatrix = np.asarray(self.antennaPos)
        v1 = antMatrix[0] - antMatrix[1]
        v2 = antMatrix[0] - antMatrix[2]
        return np.cross(v1, v2)

"""
    Calculates the E-field pattern for an array of
    "isotrophic" antennas provided:

    theta = longitude (radians) wrt to the plane of the array
    phi = latitude (radians) wrt to the plane of the array
    freq = the collective freq for the array
"""
def Epattern(theta, phi, freq, array):
    lamb = 3e8 / freq #wave length

arr = AntennaArray()
arr.addAntenna([0, 0, 0])
arr.addAntenna([1, 2, 0])
arr.addAntenna([2, 2, 0])
print(arr.reference())


Epattern(0, 0, 1000, arr.array)

#for index in range(arr.size()):
#     print('{} ..... {}'.format(arr.coordinate(index)[0], arr.coordinate(index)[1]))