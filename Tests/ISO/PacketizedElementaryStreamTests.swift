import CoreMedia
import Foundation
import Testing

@testable import HaishinKit

@Suite struct PacketizedElementaryStreamTests {
    static let dataWithVideo: Data = .init([0, 0, 1, 224, 0, 0, 128, 128, 5, 33, 0, 7, 216, 97, 0, 0, 0, 1, 9, 240, 0, 0, 0, 1, 103, 77, 64, 13, 218, 5, 7, 236, 4, 64, 0, 0, 3, 0, 64, 0, 0, 7, 131, 197, 10, 168, 0, 0, 0, 1, 104, 239, 60, 128, 0, 0, 0, 1, 101, 136, 130, 1, 15, 250, 120, 30, 255, 244, 55, 157, 215, 115, 255, 239, 112, 39, 83, 211, 17, 103, 152, 229, 241, 131, 49, 7, 123, 10, 145, 184, 0, 0, 3, 3, 133, 122, 49, 20, 214, 115, 51, 202, 59, 43, 204, 79, 27, 229, 101, 135, 60, 234, 243, 78, 210, 98, 30, 252, 36, 38, 20, 202, 41, 121, 70, 45, 15, 54, 125, 153, 199, 236, 90, 142, 247, 27, 202, 17, 205, 77, 133, 21, 189, 212, 159, 87, 222, 100, 53, 75, 211, 139, 219, 83, 89, 59, 199, 242, 182, 18, 245, 72, 70, 50, 230, 58, 82, 122, 179, 121, 243, 232, 107, 206, 157, 13])

    static let dataWithVideo2: Data = .init([0, 0, 1, 224, 2, 209, 132, 128, 5, 33, 0, 7, 146, 37, 0, 0, 0, 1, 9, 48, 0, 0, 0, 1, 33, 228, 144, 120, 102, 98, 87, 51, 222, 110, 218, 124, 79, 47, 168, 200, 143, 213, 67, 79, 163, 46, 254, 103, 220, 52, 39, 107, 213, 75, 201, 222, 47, 147, 216, 194, 11, 184, 142, 74, 241, 188, 221, 254, 170, 27, 111, 81, 253, 251, 139, 255, 85, 39, 122, 224, 199, 253, 84, 180, 166, 17, 223, 114, 126, 239, 19, 168, 111, 253, 84, 119, 125, 58, 189, 119, 177, 226, 45, 138, 245, 165, 134, 98, 245, 215, 190, 170, 12, 185, 109, 247, 199, 233, 105, 37, 234, 190, 170, 55, 148, 215, 252, 167, 79, 173, 197, 243, 122, 98, 121, 123, 196, 99, 34, 127, 213, 67, 124, 186, 229, 228, 210, 198, 242, 90, 226, 63, 213, 70, 115, 107, 69, 225, 30, 244, 5, 96, 90, 15, 45, 226, 187, 247, 23, 205, 190, 42, 85, 39, 250, 169, 56, 190, 92, 46, 105, 59, 228, 175, 55, 37, 107, 27, 223, 120, 79, 37, 247, 190, 81, 63, 203, 127, 226, 253, 157, 255, 55, 74, 144, 213, 143, 191, 179, 96, 251, 229, 230, 223, 93, 232, 255, 46, 255, 151, 127, 203, 233, 141, 196, 196, 243, 123, 99, 185, 54, 247, 254, 170, 184, 154, 46, 135, 205, 203, 233, 45, 14, 191, 189, 239, 196, 105, 120, 189, 247, 254, 233, 247, 221, 175, 228, 175, 19, 222, 222, 51, 113, 255, 234, 164, 235, 208, 175, 46, 248, 158, 189, 9, 117, 239, 252, 71, 75, 191, 203, 123, 87, 213, 145, 61, 223, 190, 90, 255, 86, 137, 230, 239, 87, 174, 95, 67, 226, 175, 115, 64, 163, 149, 98, 113, 31, 234, 164, 231, 179, 250, 215, 39, 99, 155, 151, 92, 131, 137, 188, 189, 93, 125, 244, 161, 223, 245, 82, 243, 117, 147, 147, 212, 71, 39, 185, 249, 40, 127, 201, 219, 249, 47, 223, 116, 95, 205, 62, 112, 191, 53, 223, 245, 95, 21, 43, 28, 176, 235, 147, 175, 205, 126, 26, 125, 27, 188, 184, 168, 67, 189, 245, 254, 171, 229, 246, 151, 55, 191, 154, 253, 189, 225, 78, 8, 182, 91, 205, 213, 235, 190, 138, 106, 201, 223, 110, 35, 252, 185, 132, 115, 245, 232, 71, 147, 107, 39, 23, 211, 107, 106, 249, 125, 198, 10, 226, 191, 213, 90, 151, 125, 59, 224, 189, 116, 93, 137, 125, 190, 185, 94, 142, 249, 45, 241, 61, 250, 9, 60, 98, 153, 191, 124, 18, 236, 246, 108, 30, 199, 196, 247, 123, 244, 39, 132, 175, 244, 165, 196, 71, 114, 251, 255, 205, 160, 63, 203, 191, 228, 244, 159, 126, 215, 150, 252, 253, 239, 151, 155, 181, 21, 201, 229, 97, 114, 213, 189, 114, 102, 35, 251, 210, 254, 106, 46, 72, 209, 162, 232, 190, 156, 119, 123, 255, 244, 49, 95, 56, 213, 253, 254, 106, 3, 227, 249, 122, 95, 125, 126, 246, 122, 238, 188, 188, 139, 123, 237, 116, 252, 133, 218, 102, 249, 123, 82, 68, 137, 44, 217, 199, 126, 83, 42, 169, 77, 19, 215, 164, 229, 239, 247, 217, 199, 54, 122, 250, 244, 71, 126, 190, 110, 156, 65, 244, 17, 57, 189, 252, 189, 254, 170, 151, 146, 252, 127, 54, 248, 222, 77, 241, 58, 190, 79, 81, 125, 247, 250, 169, 184, 141, 254, 227, 59, 217, 126, 41, 119, 176, 255, 43, 97, 241, 84, 98, 244, 171, 151, 162, 251, 223, 125, 236, 178, 242, 223, 249, 118, 94, 205, 63, 45, 251, 253, 163, 216, 250, 62, 93, 77, 205, 181, 159, 149, 116, 194, 28, 206, 143, 220, 189, 151, 203, 165, 159, 150, 130, 231, 230, 216, 247, 254, 239, 205, 222, 190, 125, 77, 159, 147, 223, 202, 168, 44, 156, 91, 99, 250, 41, 121, 125, 162, 119, 238, 78, 47, 93, 122, 229, 35, 11, 249, 74, 203, 153, 182, 82, 252, 190, 72, 27, 191, 119, 254, 171, 220, 157, 239, 137, 230, 223, 124, 180, 92, 33, 218, 74, 191, 16, 232, 123, 46, 185, 189, 3, 92, 157, 235, 151, 166, 136, 156, 189, 235, 155, 188, 255])

    @Test func testVideoData() {
        let pes = PacketizedElementaryStream(PacketizedElementaryStreamTests.dataWithVideo)!
        let header = pes.optionalPESHeader
        let timingInfo = header?.makeSampleTimingInfo(.invalid)
        #expect(timingInfo?.presentationTimeStamp == CMTime(value: 126384, timescale: CMTimeScale(TSTimestamp.resolution)))
        #expect(pes.payload == PacketizedElementaryStreamTests.dataWithVideo)
    }

    @Test func testVideoData2() {
        let pes = PacketizedElementaryStream(PacketizedElementaryStreamTests.dataWithVideo2)!
        let packet = pes.arrayOfPackets(1, PCR: 2).count
        #expect(packet == 4)
    }
}
