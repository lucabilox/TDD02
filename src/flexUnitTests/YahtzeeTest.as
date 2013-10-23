package flexUnitTests
{
	import flexunit.framework.Assert;

	public class YahtzeeTest
	{		
		[Before]
		public function setUp():void
		{
			var yahtzee:Yahtzee;
			
			yahtzee = new Yahtzee();
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		
		
		
		[Test]
		public function testBasicCategoryScore():void
		{
			var yahtzee:Yahtzee;
			
			yahtzee = new Yahtzee();
			
			
			Assert.assertEquals(yahtzee.getScore([1,1,1,1,1],"ones"),5);
			
			Assert.assertEquals(yahtzee.getScore([1,1,1,1,2],"ones"),4);
			
			Assert.assertEquals(yahtzee.getScore([1,1,1,2,2],"ones"),3);
			
			Assert.assertEquals(yahtzee.getScore([1,2,1,2,2],"ones"),2);
			
			Assert.assertEquals(yahtzee.getScore([2,2,2,2,2],"ones"),0);
			
			Assert.assertEquals(yahtzee.getScore([1,1,1,1,1],"twos"),0);
			
			Assert.assertEquals(yahtzee.getScore([1,1,1,1,2],"twos"),2);
			
			Assert.assertEquals(yahtzee.getScore([1,1,1,2,2],"twos"),4);
			
			Assert.assertEquals(yahtzee.getScore([1,2,1,2,2],"twos"),6);
			
			Assert.assertEquals(yahtzee.getScore([2,2,2,2,2],"twos"),10);
			
			
			Assert.assertEquals(yahtzee.getScore([1,1,3,1,1],"threes"),3);
			
			Assert.assertEquals(yahtzee.getScore([1,3,3,1,2],"threes"),6);
			
			Assert.assertEquals(yahtzee.getScore([1,1,1,2,2],"threes"),0);
			
			Assert.assertEquals(yahtzee.getScore([3,3,3,3,3],"threes"),15);
			
			Assert.assertEquals(yahtzee.getScore([2,2,3,3,3],"threes"),9);
			
			
			Assert.assertEquals(yahtzee.getScore([2,4,4,3,3],"fours"),8);
			
			Assert.assertEquals(yahtzee.getScore([2,5,3,5,3],"fives"),10);
			
			Assert.assertEquals(yahtzee.getScore([2,2,6,3,3],"sixes"),6);
			
		}
		
		[Test]
		public function testPairs():void
		{
			var yahtzee:Yahtzee;
			
			yahtzee = new Yahtzee();
			
			Assert.assertEquals(yahtzee.getScore([1,1,2,2,1],"pair"),4);
			
			Assert.assertEquals(yahtzee.getScore([1,1,1,1,1],"pair"),2);
			
			Assert.assertEquals(yahtzee.getScore([1,2,3,4,5],"pair"),0);
			
		}
		
		[Test]
		public function testThreeOfAKind():void
		{
			var yahtzee:Yahtzee;
			
			yahtzee = new Yahtzee();
			
			Assert.assertEquals(yahtzee.getScore([1,2,2,2,1],"threeofakind"),6);
			
			Assert.assertEquals(yahtzee.getScore([2,2,2,2,1],"threeofakind"),6);
			
		}
		
		[Test]
		public function testFourOfAKind():void
		{
			var yahtzee:Yahtzee;
			
			yahtzee = new Yahtzee();
			
			Assert.assertEquals(yahtzee.getScore([2,2,2,2,2],"fourofakind"),8);
			
			Assert.assertEquals(yahtzee.getScore([2,2,2,2,1],"fourofakind"),8);
			
		}
		
		
		public function testTwoPairsScore():void
		{
			var yahtzee:Yahtzee;
			
			yahtzee = new Yahtzee();
			
			Assert.assertEquals(yahtzee.getScore([2,2,2,2,2],"twopairsscore"),8);
			
			Assert.assertEquals(yahtzee.getScore([2,2,2,2,1],"twopairsscore"),8);
			
			Assert.assertEquals(yahtzee.getScore([2,2,3,2,1],"twopairsscore"),0);
			
			Assert.assertEquals(yahtzee.getScore([2,2,3,3,1],"twopairsscore"),10);
			
		}
		
	}
}