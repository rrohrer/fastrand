package fastrand;

/**
*  Implement's Intel's fastrand function (non-sse). Details can be
*  found here: https://software.intel.com/en-us/articles/fast-random-number-generator-on-the-intel-pentiumr-4-processor/
*/
class FastRand {
    public inline function new() {
        seedValue = 0;
    }

    /**
    *  Sets a new seed value. All call's to randomInt will now be based off of the new seed.
    *  @param newSeed - the new seed to be set. Original value is 0.
    */
    public function seed(newSeed:Int) : Void {
        seedValue = newSeed;
    }

    /**
    *  Returns a random int based off of the seeded value.
    *  @return - a an Int that is calculated based off the original seed + number of times
    *            this function was called.
    */
    public function randomInt() : Int {
        seedValue = (214013 * seedValue + 2531011);
        return (seedValue >> 16) & 0x7FFF;
    }

    var seedValue : Int;
}