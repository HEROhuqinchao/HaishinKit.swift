import Foundation
import XCTest

@testable import HaishinKit

final class ADTSReaderTests: XCTestCase {
    func testBytes() {
        let data = Data([255, 241, 76, 128, 46, 127, 252, 33, 26, 12, 132, 255, 255, 203, 252, 189, 165, 71, 2, 151, 152, 212, 38, 103, 11, 157, 74, 227, 156, 227, 122, 147, 92, 235, 60, 248, 210, 165, 245, 226, 83, 113, 197, 105, 159, 143, 159, 247, 13, 202, 225, 255, 58, 174, 222, 223, 155, 237, 93, 241, 248, 238, 245, 235, 143, 49, 114, 54, 75, 71, 40, 207, 134, 83, 144, 96, 193, 220, 78, 38, 18, 241, 85, 105, 198, 27, 175, 14, 7, 247, 174, 225, 163, 20, 84, 163, 26, 152, 244, 127, 82, 230, 230, 180, 170, 72, 189, 111, 112, 252, 159, 110, 68, 203, 5, 86, 85, 219, 251, 7, 54, 162, 43, 100, 84, 105, 198, 88, 101, 161, 224, 123, 249, 195, 11, 42, 42, 229, 143, 123, 213, 236, 202, 64, 41, 171, 196, 207, 105, 0, 41, 92, 169, 196, 14, 79, 195, 10, 188, 246, 128, 175, 236, 121, 43, 178, 69, 205, 87, 119, 229, 238, 212, 197, 245, 167, 32, 116, 127, 175, 230, 196, 91, 176, 243, 191, 82, 5, 126, 138, 15, 253, 63, 244, 159, 139, 254, 64, 75, 46, 174, 198, 24, 103, 255, 79, 175, 255, 246, 32, 9, 123, 28, 33, 210, 167, 54, 187, 213, 201, 89, 124, 86, 77, 115, 172, 243, 227, 74, 151, 215, 137, 75, 157, 231, 90, 103, 227, 231, 253, 192, 245, 254, 85, 11, 15, 211, 181, 134, 203, 31, 249, 111, 234, 255, 78, 183, 190, 174, 67, 145, 38, 10, 235, 46, 127, 140, 170, 86, 239, 218, 239, 49, 189, 104, 45, 121, 21, 196, 250, 30, 130, 25, 100, 22, 187, 139, 245, 170, 16, 106, 87, 73, 174, 255, 129, 5, 146, 57, 215, 47, 110, 230, 90, 204, 86, 46, 226, 177, 253, 125, 153, 157, 197, 10, 34, 190, 94, 29, 181, 109, 162, 67, 155, 196, 15, 202, 182, 166, 62, 25, 167, 253, 46, 57, 194, 91, 206, 94, 207, 217, 246, 192, 234, 188, 176, 30, 113, 48, 50, 237, 6, 164, 58, 80, 45, 110, 78, 16, 42, 30, 191, 185, 235, 123, 190, 232, 2, 94, 184, 56, 255, 241, 76, 128, 46, 63, 252, 33, 26, 14, 239, 253, 251, 235, 252, 205, 161, 137, 69, 148, 171, 100, 45, 234, 229, 243, 47, 158, 169, 114, 115, 191, 191, 62, 123, 219, 219, 116, 243, 187, 231, 126, 205, 102, 188, 254, 161, 22, 254, 181, 146, 122, 25, 251, 25, 204, 253, 193, 146, 224, 107, 133, 41, 151, 66, 78, 168, 13, 30, 18, 80, 53, 186, 39, 149, 169, 222, 1, 64, 5, 138, 141, 84, 213, 226, 202, 72, 128, 26, 182, 177, 204, 128, 172, 216, 199, 18, 103, 184, 254, 43, 41, 208, 173, 242, 153, 85, 229, 135, 156, 247, 173, 180, 84, 8, 43, 126, 134, 240, 77, 196, 86, 56, 106, 118, 216, 247, 61, 60, 192, 85, 49, 143, 175, 92, 44, 36, 185, 189, 124, 123, 179, 105, 0, 199, 195, 135, 103, 108, 0, 92, 67, 183, 134, 166, 102, 208, 65, 206, 234, 58, 165, 10, 4, 185, 215, 82, 0, 10, 235, 164, 78, 208, 9, 43, 229, 18, 0, 110, 47, 207, 57, 0, 190, 124, 46, 35, 91, 129, 0, 149, 227, 32, 26, 49, 194, 235, 0, 121, 115, 231, 231, 250, 120, 115, 135, 230, 224, 254, 77, 255, 254, 223, 242, 157, 106, 217, 32, 38, 105, 46, 133, 73, 185, 187, 212, 188, 171, 231, 170, 92, 156, 245, 124, 249, 239, 111, 215, 222, 158, 119, 205, 221, 181, 154, 243, 250, 136, 160, 109, 1, 124, 38, 201, 163, 192, 225, 141, 58, 129, 79, 151, 10, 176, 84, 198, 12, 53, 113, 145, 113, 220, 232, 220, 104, 46, 117, 183, 114, 48, 30, 55, 131, 253, 121, 98, 119, 117, 49, 87, 48, 244, 112, 198, 99, 144, 66, 85, 184, 254, 178, 0, 40, 193, 153, 141, 221, 124, 151, 215, 188, 215, 177, 118, 208, 61, 110, 158, 152, 126, 222, 36, 7, 153, 249, 30, 96, 28, 82, 128, 79, 211, 104, 5, 163, 182, 161, 167, 229, 62, 221, 75, 238, 141, 120, 130, 82, 28, 41, 246, 90, 247, 168, 35, 72, 65, 119, 111, 163, 12, 110, 253, 117, 7, 154, 255, 89, 132, 28, 255, 241, 76, 128, 43, 159, 252, 33, 26, 8, 247, 252, 255, 63, 252, 221, 38, 90, 131, 144, 171, 149, 58, 171, 174, 252, 153, 115, 158, 177, 197, 20, 248, 239, 190, 57, 243, 82, 186, 166, 159, 28, 129, 253, 231, 245, 206, 161, 249, 212, 208, 58, 145, 169, 176, 66, 174, 67, 169, 106, 4, 229, 85, 171, 135, 24, 199, 58, 158, 95, 234, 253, 62, 123, 114, 133, 86, 59, 56, 190, 47, 67, 15, 78, 251, 239, 196, 96, 154, 92, 97, 191, 27, 205, 203, 172, 21, 23, 73, 94, 131, 86, 58, 47, 42, 154, 128, 213, 93, 25, 97, 26, 193, 16, 63, 176, 198, 167, 109, 94, 167, 182, 73, 160, 14, 251, 138, 18, 21, 183, 199, 121, 137, 0, 53, 124, 39, 101, 77, 33, 115, 58, 34, 236, 90, 209, 110, 88, 221, 226, 75, 36, 86, 167, 113, 148, 83, 64, 142, 49, 19, 139, 2, 239, 85, 189, 112, 5, 130, 235, 183, 142, 51, 118, 160, 82, 163, 117, 187, 65, 197, 71, 30, 141, 107, 187, 132, 139, 139, 62, 140, 68, 104, 74, 245, 238, 220, 70, 127, 111, 15, 247, 215, 183, 221, 61, 85, 235, 142, 96, 4, 213, 161, 228, 110, 102, 181, 87, 89, 163, 46, 115, 214, 122, 227, 201, 79, 142, 251, 175, 50, 165, 117, 77, 62, 57, 10, 115, 184, 63, 5, 10, 204, 112, 39, 11, 90, 243, 140, 135, 122, 66, 54, 150, 230, 198, 205, 216, 241, 40, 84, 188, 61, 166, 98, 243, 168, 102, 226, 120, 22, 1, 85, 24, 223, 173, 214, 205, 65, 17, 65, 49, 209, 199, 188, 0, 153, 10, 145, 5, 178, 45, 203, 247, 220, 41, 50, 32, 58, 208, 59, 219, 36, 98, 174, 247, 231, 0, 211, 1, 106, 2, 232, 1, 187, 116, 174, 9, 70, 14, 202, 170, 33, 161, 126, 137, 113, 21, 200, 216, 211, 215, 165, 225, 145, 55, 14, 106, 255, 234, 238, 83, 254, 147, 221, 19, 1, 192, 255, 241, 76, 128, 36, 127, 252, 33, 26, 8, 121, 191, 255, 253, 252, 229, 37, 208, 183, 119, 237, 82, 235, 51, 137, 85, 117, 172, 184, 14, 57, 151, 87, 82, 174, 80, 192, 116, 142, 120, 77, 106, 188, 248, 9, 238, 1, 0, 80, 221, 211, 94, 8, 145, 178, 226, 112, 182, 28, 126, 143, 62, 117, 68, 35, 20, 43, 186, 239, 253, 107, 77, 86, 230, 26, 211, 171, 179, 213, 132, 68, 213, 43, 43, 220, 252, 226, 210, 169, 42, 75, 197, 6, 163, 85, 49, 85, 85, 233, 244, 103, 98, 40, 76, 179, 212, 173, 17, 84, 206, 245, 113, 221, 218, 138, 25, 1, 243, 48, 173, 238, 245, 91, 217, 17, 220, 189, 210, 102, 195, 107, 74, 68, 196, 232, 227, 59, 153, 111, 107, 19, 83, 81, 209, 114, 147, 25, 128, 198, 234, 139, 169, 11, 170, 98, 150, 9, 156, 203, 6, 235, 83, 48, 134, 105, 66, 169, 80, 32, 166, 202, 184, 146, 211, 65, 166, 113, 85, 92, 138, 0, 39, 236, 107, 19, 48, 185, 159, 207, 165, 214, 77, 85, 93, 86, 178, 224, 56, 230, 93, 93, 74, 210, 134, 3, 104, 220, 224, 118, 234, 36, 199, 17, 238, 214, 115, 95, 68, 127, 47, 106, 183, 53, 16, 21, 215, 143, 104, 216, 162, 98, 107, 143, 209, 223, 32, 93, 42, 94, 190, 164, 9, 242, 59, 15, 167, 146, 65, 62, 89, 57, 23, 253, 12, 138, 20, 137, 97, 142, 37, 106, 183, 74, 238, 73, 111, 202, 88, 64, 68, 14, 21, 152, 17, 234, 247, 30, 189, 223, 128, 0, 7, 3, 125, 105, 94, 124, 0, 0, 0, 112, 255, 241, 76, 128, 39, 127, 252, 33, 26, 9, 175, 222, 223, 251, 252, 157, 161, 216, 172, 35, 152, 85, 239, 199, 124, 85, 231, 28, 245, 186, 185, 80, 137, 38, 235, 89, 198, 113, 227, 137, 55, 24, 27, 147, 162, 200, 160, 61, 107, 32, 167, 41, 218, 221, 94, 194, 15, 97, 1, 237, 63, 105, 84, 184, 198, 203, 156, 111, 226, 115, 202, 51, 187, 86, 56, 198, 134, 238, 87, 231, 121, 229, 57, 170, 25, 207, 19, 110, 93, 207, 15, 102, 11, 155, 217, 221, 237, 189, 247, 107, 161, 215, 108, 14, 125, 221, 81, 151, 62, 157, 109, 168, 187, 142, 88, 43, 60, 84, 81, 206, 33, 101, 106, 214, 154, 119, 205, 201, 89, 232, 3, 64, 139, 196, 170, 235, 82, 221, 214, 34, 154, 205, 148, 153, 178, 8, 199, 12, 92, 74, 110, 102, 233, 185, 247, 239, 113, 245, 216, 149, 162, 101, 9, 224, 39, 44, 101, 75, 183, 23, 24, 135, 0, 101, 194, 246, 168, 185, 243, 81, 83, 213, 6, 112, 91, 243, 3, 101, 196, 168, 114, 229, 143, 127, 151, 251, 228, 106, 19, 116, 149, 89, 209, 187, 227, 215, 152, 206, 57, 235, 119, 82, 167, 125, 76, 212, 155, 173, 103, 25, 198, 228, 155, 140, 8, 102, 159, 50, 178, 9, 21, 171, 81, 136, 32, 206, 82, 226, 142, 168, 23, 72, 97, 153, 149, 199, 250, 248, 65, 72, 173, 218, 248, 157, 125, 101, 1, 21, 186, 191, 248, 164, 106, 244, 173, 25, 123, 213, 141, 84, 250, 16, 120, 140, 213, 24, 196, 106, 208, 129, 150, 198, 97, 68, 212, 160, 42, 168, 32, 133, 95, 138, 255, 65, 176, 236, 19, 205, 175, 150, 224, 34, 0, 14, 191, 249, 6, 0, 159, 169, 128, 91, 24, 0, 56, 255, 241, 76, 128, 38, 127, 252, 33, 26, 15, 191, 255, 95, 247, 252, 149, 134, 142, 181, 33, 26, 95, 53, 213, 93, 110, 107, 53, 149, 124, 233, 165, 86, 183, 170, 188, 187, 110, 56, 149, 87, 216, 156, 79, 202, 243, 241, 49, 111, 67, 60, 165, 167, 176, 12, 98, 22, 235, 197, 230, 243, 90, 200, 231, 26, 124, 227, 244, 240, 43, 124, 251, 72, 137, 207, 76, 127, 251, 176, 84, 86, 101, 231, 252, 63, 70, 191, 93, 254, 114, 170, 204, 220, 251, 254, 102, 190, 26, 206, 209, 113, 21, 223, 194, 133, 208, 179, 9, 177, 150, 90, 178, 113, 145, 21, 88, 171, 199, 126, 243, 142, 249, 9, 107, 107, 156, 235, 129, 66, 204, 229, 143, 65, 51, 6, 255, 105, 135, 198, 171, 143, 159, 253, 140, 140, 36, 255, 228, 207, 188, 58, 214, 26, 246, 240, 33, 91, 221, 85, 118, 225, 237, 97, 53, 118, 184, 245, 187, 127, 81, 146, 213, 237, 33, 120, 117, 187, 236, 8, 233, 73, 177, 130, 166, 14, 167, 167, 249, 0, 18, 80, 149, 88, 209, 243, 93, 85, 214, 230, 179, 89, 87, 206, 154, 231, 91, 235, 122, 171, 203, 180, 219, 137, 85, 125, 131, 239, 219, 49, 139, 135, 188, 86, 142, 251, 46, 146, 12, 22, 36, 194, 53, 51, 89, 169, 124, 123, 63, 204, 14, 70, 131, 189, 199, 191, 69, 100, 38, 125, 209, 123, 231, 51, 146, 150, 235, 161, 156, 231, 27, 130, 22, 130, 56, 139, 254, 98, 17, 163, 1, 75, 213, 253, 201, 26, 255, 91, 179, 28, 24, 16, 194, 66, 20, 209, 91, 228, 159, 131, 10, 17, 55, 249, 112, 84, 80, 2, 160, 86, 249, 160, 176, 34, 1, 196, 0, 14, 255, 241, 76, 128, 45, 31, 252, 33, 26, 8, 253, 223, 127, 253, 252, 181, 162, 10, 66, 130, 170, 80, 98, 18, 41, 137, 215, 219, 245, 205, 231, 158, 201, 94, 186, 227, 43, 88, 189, 100, 69, 112, 222, 113, 169, 145, 128, 51, 60, 189, 53, 134, 250, 171, 120, 178, 58, 170, 188, 63, 75, 179, 16, 245, 160, 95, 91, 215, 94, 42, 250, 19, 214, 119, 97, 72, 46, 184, 209, 78, 48, 210, 209, 233, 207, 168, 67, 137, 10, 35, 114, 148, 115, 40, 42, 55, 42, 27, 233, 133, 232, 0, 214, 120, 81, 195, 250, 73, 199, 247, 70, 59, 249, 76, 234, 186, 125, 25, 27, 205, 220, 174, 239, 26, 141, 195, 143, 124, 235, 68, 86, 121, 5, 83, 57, 195, 121, 231, 209, 55, 137, 138, 139, 41, 62, 143, 101, 36, 74, 29, 239, 195, 230, 24, 20, 112, 4, 21, 68, 195, 32, 19, 157, 246, 57, 27, 212, 123, 184, 181, 48, 15, 95, 94, 49, 88, 44, 42, 151, 9, 195, 60, 242, 76, 207, 83, 131, 196, 88, 136, 122, 24, 99, 4, 231, 237, 208, 52, 78, 64, 20, 151, 77, 248, 247, 179, 230, 2, 74, 208, 187, 18, 188, 117, 198, 111, 60, 246, 74, 155, 227, 43, 85, 87, 172, 136, 174, 27, 205, 113, 50, 48, 12, 219, 243, 38, 63, 212, 127, 249, 20, 122, 126, 71, 247, 246, 133, 206, 9, 186, 93, 12, 109, 145, 21, 31, 41, 174, 141, 126, 19, 45, 52, 157, 71, 9, 225, 57, 255, 60, 2, 20, 238, 235, 156, 227, 229, 25, 2, 171, 187, 216, 168, 196, 69, 8, 156, 94, 172, 170, 128, 17, 212, 93, 214, 224, 146, 243, 154, 9, 133, 9, 231, 65, 64, 165, 199, 176, 38, 226, 3, 29, 25, 81, 21, 50, 90, 91, 35, 57, 144, 92, 232, 0, 26, 237, 21, 25, 1, 85, 147, 177, 86, 13, 232, 109, 41, 90, 25, 92, 228, 60, 152, 255, 47, 122, 217, 45, 253, 92, 114, 188, 88, 16, 164, 149, 39, 112, 1, 192, 255, 241, 76, 128, 46, 223, 252, 33, 26, 11, 58, 194, 255, 255, 220, 141, 181, 71, 65, 98, 172, 155, 227, 221, 237, 85, 190, 187, 156, 120, 173, 71, 62, 114, 229, 85, 235, 154, 213, 179, 90, 189, 253, 253, 246, 32, 124, 117, 187, 130, 253, 80, 4, 156, 168, 108, 101, 192, 150, 234, 66, 72, 107, 163, 169, 64, 138, 80, 192, 16, 14, 70, 229, 128, 35, 25, 114, 87, 117, 95, 121, 68, 33, 216, 47, 207, 236, 129, 124, 105, 65, 65, 153, 204, 226, 0, 90, 249, 141, 184, 118, 49, 129, 48, 161, 69, 215, 74, 102, 188, 117, 107, 213, 238, 188, 230, 114, 170, 224, 130, 98, 119, 215, 21, 52, 215, 44, 197, 35, 61, 222, 218, 165, 49, 139, 140, 110, 167, 159, 88, 5, 148, 234, 231, 83, 32, 23, 228, 153, 2, 106, 204, 97, 149, 226, 196, 166, 56, 186, 106, 136, 64, 139, 189, 97, 122, 36, 29, 220, 245, 80, 196, 0, 190, 190, 12, 168, 5, 85, 239, 121, 9, 85, 61, 248, 171, 186, 65, 137, 42, 186, 226, 50, 58, 125, 159, 119, 15, 195, 193, 143, 131, 171, 194, 229, 204, 42, 132, 137, 190, 53, 61, 20, 128, 2, 50, 214, 65, 162, 169, 78, 79, 126, 57, 206, 170, 179, 142, 61, 248, 162, 249, 213, 101, 202, 171, 215, 53, 171, 102, 181, 123, 182, 195, 158, 117, 131, 14, 85, 226, 158, 237, 82, 125, 219, 65, 1, 88, 145, 38, 27, 15, 158, 18, 36, 3, 52, 76, 204, 73, 161, 111, 56, 139, 233, 77, 41, 79, 118, 53, 64, 228, 69, 38, 105, 85, 12, 190, 51, 48, 246, 44, 204, 92, 87, 122, 157, 127, 105, 30, 129, 155, 178, 177, 142, 114, 162, 52, 90, 2, 201, 97, 117, 155, 136, 58, 158, 228, 81, 200, 94, 133, 44, 105, 88, 177, 231, 156, 0, 95, 130, 181, 224, 154, 208, 7, 78, 238, 79, 118, 167, 78, 112, 126, 248, 53, 251, 187, 88, 212, 116, 205, 176, 150, 167, 59, 94, 148, 149, 224, 190, 45, 43, 115, 182, 85, 170, 88, 169, 124, 210, 53, 128, 56])

        let reader = ADTSReader()
        reader.read(data)
        var iterator = reader.makeIterator()
        while let range = iterator.next() {
        }
    }
}
