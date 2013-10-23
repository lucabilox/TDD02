package
{
	import flash.display.Sprite;
	import flash.sampler.NewObjectSample;
	import flash.utils.Dictionary;
	
	public class Yahtzee
	{
		private var categoryParameters:Dictionary;
		
		public function Yahtzee()
		{
			categoryParameters = new Dictionary();
			categoryParameters["ones"] = {"function":getBasicCategoryScore, "functionParameters":1};
			categoryParameters["twos"] = {"function":getBasicCategoryScore, "functionParameters":2};
			categoryParameters["threes"] = {"function":getBasicCategoryScore, "functionParameters":3};
			categoryParameters["fours"] = {"function":getBasicCategoryScore, "functionParameters":4};
			categoryParameters["fives"] = {"function":getBasicCategoryScore, "functionParameters":5};
			categoryParameters["sixes"] = {"function":getBasicCategoryScore, "functionParameters":6};
			
			categoryParameters["pair"] = {"function":getGroupScore, "functionParameters":2};
			categoryParameters["threeofakind"] = {"function":getGroupScore, "functionParameters":3};
			categoryParameters["fourofakind"] = {"function":getGroupScore, "functionParameters":4};
			
			categoryParameters["twopairsscore"] = {"function":getTwoPairsScore};
			
			
		}
		
		public function testTest(value:int):int{
			return value
		}
		
		public function getScore(dices:Array, category:String):int
		{
			
			if (categoryParameters[category]["functionParameters"]) 
			{
				return categoryParameters[category]["function"](dices, categoryParameters[category]["functionParameters"]);
			}else{
				return categoryParameters[category]["function"](dices);
			}
			
		}
		
		private function getBasicCategoryScore(dices:Array, categoryValue:int):int{
			var score:int=0;
			for each(var dice:int in dices)
			{
				if(dice==categoryValue)
				{
					score+= categoryValue;
				}
			}
			
			return score
		}
		
		private function getGroupScore(dices:Array,groupSize:int):int{
			var groupCount:Array = [0,0,0,0,0,0]
			var groupScore:Array = [0,0,0,0,0,0]
			
			for each (var dice:int in dices) 
			{
				groupCount[dice] ++
			}
			
			for (var i:int = 0; i < groupCount.length; i++)
			{
				if (groupCount[i] >= groupSize) 
				{
					groupScore[i] = groupSize * i;
				}
			}
			

			groupScore.sort();
			
			return groupScore[groupScore.length -1];
			
		}
		
		private function getTwoPairsScore(dices:Array):int{
			
			var groupCount:Array = [0,0,0,0,0,0]
			var groupScore:Array = [0,0,0,0,0,0]
			
			for each (var dice:int in dices) 
			{
				groupCount[dice] ++
			}
			
			for (var i:int = 0; i < groupCount.length; i++)
			{
				if (groupCount[i] >= 2) 
				{
					groupScore[i] = 2 * i;
				}
			}
			
			
			groupScore.sort();
			
			if (groupScore[groupScore.length -1] > 0 && groupScore[groupScore.length -2] > 0) 
			{
				return groupScore[groupScore.length -1] + groupScore[groupScore.length -2];
			}else{
				return 0
			}
			
		}
		

	}
}