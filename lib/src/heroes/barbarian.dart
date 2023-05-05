import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/barbarian_cluster.dart';
import 'package:d4_utils/src/enums/barbarian_skill.dart';
import 'package:d4_utils/src/enums/hero.dart';
import 'package:d4_utils/src/enums/skill_type.dart';

abstract class Barbarian {
  static Tree<Enum> _skillTree(Enum e, List<Tree<Enum>> children) =>
      Tree(element: e, children: children);

  static List<Tree<Enum>> get _childless => const [];

  static BarbarianCluster clusterOf(BarbarianSkill barbarianSkill) {
    switch (barbarianSkill) {
      case BarbarianSkill.Bash:
      case BarbarianSkill.EnhancedBash:
      case BarbarianSkill.BattleBash:
      case BarbarianSkill.CombatBash:
      case BarbarianSkill.Flay:
      case BarbarianSkill.EnhancedFlay:
      case BarbarianSkill.BattleFlay:
      case BarbarianSkill.CombatFlay:
      case BarbarianSkill.Frenzy:
      case BarbarianSkill.EnhancedFrenzy:
      case BarbarianSkill.BattleFrenzy:
      case BarbarianSkill.CombatFrenzy:
      case BarbarianSkill.LungingStrike:
      case BarbarianSkill.EnhancedLungingStrike:
      case BarbarianSkill.BattleLungingStrike:
      case BarbarianSkill.CombatLungingStrike:
        return BarbarianCluster.Basic;
      case BarbarianSkill.DoubleSwing:
      case BarbarianSkill.EnhancedDoubleSwing:
      case BarbarianSkill.FuriousDoubleSwing:
      case BarbarianSkill.ViolentDoubleSwing:
      case BarbarianSkill.HammerOfTheAncients:
      case BarbarianSkill.EnhancedHammerOfTheAncients:
      case BarbarianSkill.FuriousHammerOfTheAncients:
      case BarbarianSkill.ViolentHammerOfTheAncients:
      case BarbarianSkill.Rend:
      case BarbarianSkill.EnhancedRend:
      case BarbarianSkill.FuriousRend:
      case BarbarianSkill.ViolentRend:
      case BarbarianSkill.Upheaval:
      case BarbarianSkill.EnhancedUpheaval:
      case BarbarianSkill.FuriousUpheaval:
      case BarbarianSkill.ViolentUpheaval:
      case BarbarianSkill.Whirlwind:
      case BarbarianSkill.EnhancedWhirlwind:
      case BarbarianSkill.FuriousWhirlwind:
      case BarbarianSkill.ViolentWhirlwind:
      case BarbarianSkill.PressurePoint:
      case BarbarianSkill.EndlessFury:
        return BarbarianCluster.Core;
      case BarbarianSkill.ChallengingShout:
      case BarbarianSkill.EnhancedChallengingShout:
      case BarbarianSkill.StrategicChallengingShout:
      case BarbarianSkill.TacticalChallengingShout:
      case BarbarianSkill.GroundStomp:
      case BarbarianSkill.EnhancedGroundStomp:
      case BarbarianSkill.StrategicGroundStomp:
      case BarbarianSkill.TacticalGroundStomp:
      case BarbarianSkill.IronSkin:
      case BarbarianSkill.EnhancedIronSkin:
      case BarbarianSkill.StrategicIronSkin:
      case BarbarianSkill.TacticalIronSkin:
      case BarbarianSkill.RallyingCry:
      case BarbarianSkill.EnhancedRallyingCry:
      case BarbarianSkill.StrategicRallyingCry:
      case BarbarianSkill.TacticalRallyingCry:
      case BarbarianSkill.ImposingPresence:
      case BarbarianSkill.MartialVigor:
      case BarbarianSkill.Outburst:
      case BarbarianSkill.ToughAsNails:
        return BarbarianCluster.Defensive;
      case BarbarianSkill.Charge:
      case BarbarianSkill.EnhancedCharge:
      case BarbarianSkill.MightyCharge:
      case BarbarianSkill.PowerCharge:
      case BarbarianSkill.Kick:
      case BarbarianSkill.EnhancedKick:
      case BarbarianSkill.MightyKick:
      case BarbarianSkill.PowerKick:
      case BarbarianSkill.Leap:
      case BarbarianSkill.EnhancedLeap:
      case BarbarianSkill.MightyLeap:
      case BarbarianSkill.PowerLeap:
      case BarbarianSkill.WarCry:
      case BarbarianSkill.EnhancedWarCry:
      case BarbarianSkill.MightyWarCry:
      case BarbarianSkill.PowerWarCry:
      case BarbarianSkill.BoomingVoice:
      case BarbarianSkill.RaidLeader:
      case BarbarianSkill.GutturalYell:
      case BarbarianSkill.AggressiveResistance:
      case BarbarianSkill.BattleFervor:
      case BarbarianSkill.ProlificFury:
      case BarbarianSkill.Swiftness:
      case BarbarianSkill.QuickImpulses:
        return BarbarianCluster.Brawling;
      case BarbarianSkill.DeathBlow:
      case BarbarianSkill.EnhancedDeathBlow:
      case BarbarianSkill.FightersDeathBlow:
      case BarbarianSkill.WarriorsDeathBlow:
      case BarbarianSkill.Rupture:
      case BarbarianSkill.EnhancedRupture:
      case BarbarianSkill.FightersRupture:
      case BarbarianSkill.WarriorsRupture:
      case BarbarianSkill.SteelGrasp:
      case BarbarianSkill.EnhancedSteelGrasp:
      case BarbarianSkill.FightersSteelGrasp:
      case BarbarianSkill.WarriorsSteelGrasp:
      case BarbarianSkill.PitFighter:
      case BarbarianSkill.NoMercy:
      case BarbarianSkill.SlayingStrike:
      case BarbarianSkill.ExposeVulnerability:
      case BarbarianSkill.ThickSkin:
      case BarbarianSkill.DefensiveStance:
      case BarbarianSkill.Counteroffensive:
      case BarbarianSkill.Hamstring:
      case BarbarianSkill.CutToTheBone:
        return BarbarianCluster.WeaponMastery;
      case BarbarianSkill.CallOfTheAncients:
      case BarbarianSkill.PrimeCallOfTheAncients:
      case BarbarianSkill.SupremeCallOfTheAncients:
      case BarbarianSkill.IronMaelstrom:
      case BarbarianSkill.PrimeIronMaelstrom:
      case BarbarianSkill.SupremeIronMaelstrom:
      case BarbarianSkill.WrathOfTheBerserker:
      case BarbarianSkill.PrimeWrathOfTheBerserker:
      case BarbarianSkill.SupremeWrathOfTheBerserker:
      case BarbarianSkill.HeavyHanded:
      case BarbarianSkill.Wallop:
      case BarbarianSkill.BruteForce:
      case BarbarianSkill.Concussion:
      case BarbarianSkill.TemperedFury:
      case BarbarianSkill.FuriousImpulse:
      case BarbarianSkill.InvigoratingFury:
      case BarbarianSkill.Duelist:
        return BarbarianCluster.Ultimate;
      case BarbarianSkill.Unconstrained:
      case BarbarianSkill.WalkingArsenal:
      case BarbarianSkill.UnbridledRage:
      case BarbarianSkill.GushingWounds:
        return BarbarianCluster.KeyPassive;
      default:
        assert(false, 'case $barbarianSkill missing');
        return BarbarianCluster.Basic;
    }
  }

  static SkillType skillTypeOf(BarbarianSkill barbarianSkill) {
    switch (barbarianSkill) {
      case BarbarianSkill.Bash:
      case BarbarianSkill.Flay:
      case BarbarianSkill.Frenzy:
      case BarbarianSkill.LungingStrike:
      case BarbarianSkill.DoubleSwing:
      case BarbarianSkill.HammerOfTheAncients:
      case BarbarianSkill.Rend:
      case BarbarianSkill.Upheaval:
      case BarbarianSkill.Whirlwind:
      case BarbarianSkill.ChallengingShout:
      case BarbarianSkill.GroundStomp:
      case BarbarianSkill.IronSkin:
      case BarbarianSkill.RallyingCry:
      case BarbarianSkill.Charge:
      case BarbarianSkill.Kick:
      case BarbarianSkill.Leap:
      case BarbarianSkill.WarCry:
      case BarbarianSkill.DeathBlow:
      case BarbarianSkill.Rupture:
      case BarbarianSkill.SteelGrasp:
      case BarbarianSkill.CallOfTheAncients:
      case BarbarianSkill.IronMaelstrom:
      case BarbarianSkill.WrathOfTheBerserker:
        return SkillType.Active;
      case BarbarianSkill.EnhancedBash:
      case BarbarianSkill.EnhancedFlay:
      case BarbarianSkill.EnhancedFrenzy:
      case BarbarianSkill.EnhancedLungingStrike:
      case BarbarianSkill.EnhancedDoubleSwing:
      case BarbarianSkill.EnhancedHammerOfTheAncients:
      case BarbarianSkill.EnhancedRend:
      case BarbarianSkill.EnhancedUpheaval:
      case BarbarianSkill.EnhancedWhirlwind:
      case BarbarianSkill.EnhancedChallengingShout:
      case BarbarianSkill.EnhancedGroundStomp:
      case BarbarianSkill.EnhancedIronSkin:
      case BarbarianSkill.EnhancedRallyingCry:
      case BarbarianSkill.EnhancedCharge:
      case BarbarianSkill.EnhancedKick:
      case BarbarianSkill.EnhancedLeap:
      case BarbarianSkill.EnhancedWarCry:
      case BarbarianSkill.EnhancedDeathBlow:
      case BarbarianSkill.EnhancedRupture:
      case BarbarianSkill.EnhancedSteelGrasp:
      case BarbarianSkill.PrimeCallOfTheAncients:
      case BarbarianSkill.PrimeIronMaelstrom:
      case BarbarianSkill.PrimeWrathOfTheBerserker:
        return SkillType.Enhancement;
      case BarbarianSkill.BattleBash:
      case BarbarianSkill.CombatBash:
      case BarbarianSkill.BattleFlay:
      case BarbarianSkill.CombatFlay:
      case BarbarianSkill.BattleFrenzy:
      case BarbarianSkill.CombatFrenzy:
      case BarbarianSkill.BattleLungingStrike:
      case BarbarianSkill.CombatLungingStrike:
      case BarbarianSkill.FuriousDoubleSwing:
      case BarbarianSkill.ViolentDoubleSwing:
      case BarbarianSkill.FuriousHammerOfTheAncients:
      case BarbarianSkill.ViolentHammerOfTheAncients:
      case BarbarianSkill.FuriousRend:
      case BarbarianSkill.ViolentRend:
      case BarbarianSkill.FuriousUpheaval:
      case BarbarianSkill.ViolentUpheaval:
      case BarbarianSkill.FuriousWhirlwind:
      case BarbarianSkill.ViolentWhirlwind:
      case BarbarianSkill.StrategicChallengingShout:
      case BarbarianSkill.TacticalChallengingShout:
      case BarbarianSkill.StrategicGroundStomp:
      case BarbarianSkill.TacticalGroundStomp:
      case BarbarianSkill.StrategicIronSkin:
      case BarbarianSkill.TacticalIronSkin:
      case BarbarianSkill.StrategicRallyingCry:
      case BarbarianSkill.TacticalRallyingCry:
      case BarbarianSkill.MightyCharge:
      case BarbarianSkill.PowerCharge:
      case BarbarianSkill.MightyKick:
      case BarbarianSkill.PowerKick:
      case BarbarianSkill.MightyLeap:
      case BarbarianSkill.PowerLeap:
      case BarbarianSkill.MightyWarCry:
      case BarbarianSkill.PowerWarCry:
      case BarbarianSkill.FightersDeathBlow:
      case BarbarianSkill.WarriorsDeathBlow:
      case BarbarianSkill.FightersRupture:
      case BarbarianSkill.WarriorsRupture:
      case BarbarianSkill.FightersSteelGrasp:
      case BarbarianSkill.WarriorsSteelGrasp:
      case BarbarianSkill.SupremeCallOfTheAncients:
      case BarbarianSkill.SupremeIronMaelstrom:
      case BarbarianSkill.SupremeWrathOfTheBerserker:
        return SkillType.Upgrade;
      case BarbarianSkill.PressurePoint:
      case BarbarianSkill.EndlessFury:
      case BarbarianSkill.ImposingPresence:
      case BarbarianSkill.MartialVigor:
      case BarbarianSkill.Outburst:
      case BarbarianSkill.ToughAsNails:
      case BarbarianSkill.BoomingVoice:
      case BarbarianSkill.RaidLeader:
      case BarbarianSkill.GutturalYell:
      case BarbarianSkill.AggressiveResistance:
      case BarbarianSkill.BattleFervor:
      case BarbarianSkill.ProlificFury:
      case BarbarianSkill.Swiftness:
      case BarbarianSkill.QuickImpulses:
      case BarbarianSkill.PitFighter:
      case BarbarianSkill.NoMercy:
      case BarbarianSkill.SlayingStrike:
      case BarbarianSkill.ExposeVulnerability:
      case BarbarianSkill.ThickSkin:
      case BarbarianSkill.DefensiveStance:
      case BarbarianSkill.Counteroffensive:
      case BarbarianSkill.Hamstring:
      case BarbarianSkill.CutToTheBone:
      case BarbarianSkill.HeavyHanded:
      case BarbarianSkill.Wallop:
      case BarbarianSkill.BruteForce:
      case BarbarianSkill.Concussion:
      case BarbarianSkill.TemperedFury:
      case BarbarianSkill.FuriousImpulse:
      case BarbarianSkill.InvigoratingFury:
      case BarbarianSkill.Duelist:
      case BarbarianSkill.Unconstrained:
      case BarbarianSkill.WalkingArsenal:
      case BarbarianSkill.UnbridledRage:
      case BarbarianSkill.GushingWounds:
        return SkillType.Passive;
    }
  }

  static Tree<Enum> get bash => _skillTree(
        BarbarianSkill.Bash,
        [
          _skillTree(
            BarbarianSkill.EnhancedBash,
            [
              _skillTree(BarbarianSkill.BattleBash, _childless),
              _skillTree(BarbarianSkill.CombatBash, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get flay => _skillTree(
        BarbarianSkill.Flay,
        [
          _skillTree(
            BarbarianSkill.EnhancedFlay,
            [
              _skillTree(BarbarianSkill.BattleFlay, _childless),
              _skillTree(BarbarianSkill.CombatFlay, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get frenzy => _skillTree(
        BarbarianSkill.Frenzy,
        [
          _skillTree(
            BarbarianSkill.EnhancedFrenzy,
            [
              _skillTree(BarbarianSkill.BattleFrenzy, _childless),
              _skillTree(BarbarianSkill.CombatFrenzy, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get lungingStrike => _skillTree(
        BarbarianSkill.LungingStrike,
        [
          _skillTree(
            BarbarianSkill.EnhancedLungingStrike,
            [
              _skillTree(BarbarianSkill.BattleLungingStrike, _childless),
              _skillTree(BarbarianSkill.CombatLungingStrike, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get doubleSwing => _skillTree(
        BarbarianSkill.DoubleSwing,
        [
          _skillTree(
            BarbarianSkill.EnhancedDoubleSwing,
            [
              _skillTree(BarbarianSkill.FuriousDoubleSwing, _childless),
              _skillTree(BarbarianSkill.ViolentDoubleSwing, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get hammerOfTheAncients => _skillTree(
        BarbarianSkill.HammerOfTheAncients,
        [
          _skillTree(
            BarbarianSkill.EnhancedHammerOfTheAncients,
            [
              _skillTree(BarbarianSkill.FuriousHammerOfTheAncients, _childless),
              _skillTree(BarbarianSkill.ViolentHammerOfTheAncients, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get rend => _skillTree(
        BarbarianSkill.Rend,
        [
          _skillTree(
            BarbarianSkill.EnhancedRend,
            [
              _skillTree(BarbarianSkill.FuriousRend, _childless),
              _skillTree(BarbarianSkill.ViolentRend, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get upheaval => _skillTree(
        BarbarianSkill.Upheaval,
        [
          _skillTree(
            BarbarianSkill.EnhancedUpheaval,
            [
              _skillTree(BarbarianSkill.FuriousUpheaval, _childless),
              _skillTree(BarbarianSkill.ViolentUpheaval, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get whirlwind => _skillTree(
        BarbarianSkill.Whirlwind,
        [
          _skillTree(
            BarbarianSkill.EnhancedWhirlwind,
            [
              _skillTree(BarbarianSkill.FuriousWhirlwind, _childless),
              _skillTree(BarbarianSkill.ViolentWhirlwind, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get pressurePoint =>
      _skillTree(BarbarianSkill.PressurePoint, _childless);

  static Tree<Enum> get endlessFury =>
      _skillTree(BarbarianSkill.EndlessFury, _childless);

  static Tree<Enum> get challengingShout => _skillTree(
        BarbarianSkill.ChallengingShout,
        [
          _skillTree(
            BarbarianSkill.EnhancedChallengingShout,
            [
              _skillTree(BarbarianSkill.StrategicChallengingShout, _childless),
              _skillTree(BarbarianSkill.TacticalChallengingShout, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get groundStomp => _skillTree(
        BarbarianSkill.GroundStomp,
        [
          _skillTree(
            BarbarianSkill.EnhancedGroundStomp,
            [
              _skillTree(BarbarianSkill.StrategicGroundStomp, _childless),
              _skillTree(BarbarianSkill.TacticalGroundStomp, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get ironSkin => _skillTree(
        BarbarianSkill.IronSkin,
        [
          _skillTree(
            BarbarianSkill.EnhancedIronSkin,
            [
              _skillTree(BarbarianSkill.StrategicIronSkin, _childless),
              _skillTree(BarbarianSkill.TacticalIronSkin, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get rallyingCry => _skillTree(
        BarbarianSkill.RallyingCry,
        [
          _skillTree(
            BarbarianSkill.EnhancedRallyingCry,
            [
              _skillTree(BarbarianSkill.StrategicRallyingCry, _childless),
              _skillTree(BarbarianSkill.TacticalRallyingCry, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get imposingPresence => _skillTree(
        BarbarianSkill.ImposingPresence,
        [
          _skillTree(BarbarianSkill.MartialVigor, _childless),
        ],
      );

  static Tree<Enum> get outburst => _skillTree(
        BarbarianSkill.Outburst,
        [
          _skillTree(BarbarianSkill.ToughAsNails, _childless),
        ],
      );

  static Tree<Enum> get charge => _skillTree(
        BarbarianSkill.Charge,
        [
          _skillTree(
            BarbarianSkill.EnhancedCharge,
            [
              _skillTree(BarbarianSkill.MightyCharge, _childless),
              _skillTree(BarbarianSkill.PowerCharge, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get kick => _skillTree(
        BarbarianSkill.Kick,
        [
          _skillTree(
            BarbarianSkill.EnhancedKick,
            [
              _skillTree(BarbarianSkill.MightyKick, _childless),
              _skillTree(BarbarianSkill.PowerKick, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get leap => _skillTree(
        BarbarianSkill.Leap,
        [
          _skillTree(
            BarbarianSkill.EnhancedLeap,
            [
              _skillTree(BarbarianSkill.MightyLeap, _childless),
              _skillTree(BarbarianSkill.PowerLeap, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get warCry => _skillTree(
        BarbarianSkill.WarCry,
        [
          _skillTree(
            BarbarianSkill.EnhancedWarCry,
            [
              _skillTree(BarbarianSkill.MightyWarCry, _childless),
              _skillTree(BarbarianSkill.PowerWarCry, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get boomingVoice => _skillTree(
        BarbarianSkill.BoomingVoice,
        [
          _skillTree(BarbarianSkill.RaidLeader, _childless),
          _skillTree(BarbarianSkill.GutturalYell, _childless),
        ],
      );

  static Tree<Enum> get aggressiveResistance => _skillTree(
        BarbarianSkill.AggressiveResistance,
        [
          _skillTree(BarbarianSkill.BattleFervor, _childless),
          _skillTree(BarbarianSkill.ProlificFury, _childless),
        ],
      );

  static Tree<Enum> get swiftness => _skillTree(
        BarbarianSkill.Swiftness,
        [
          _skillTree(BarbarianSkill.QuickImpulses, _childless),
        ],
      );

  static Tree<Enum> get deathBlow => _skillTree(
        BarbarianSkill.DeathBlow,
        [
          _skillTree(
            BarbarianSkill.EnhancedDeathBlow,
            [
              _skillTree(BarbarianSkill.FightersDeathBlow, _childless),
              _skillTree(BarbarianSkill.WarriorsDeathBlow, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get rupture => _skillTree(
        BarbarianSkill.Rupture,
        [
          _skillTree(
            BarbarianSkill.EnhancedRupture,
            [
              _skillTree(BarbarianSkill.FightersRupture, _childless),
              _skillTree(BarbarianSkill.WarriorsRupture, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get steelGrasp => _skillTree(
        BarbarianSkill.SteelGrasp,
        [
          _skillTree(
            BarbarianSkill.EnhancedSteelGrasp,
            [
              _skillTree(BarbarianSkill.FightersSteelGrasp, _childless),
              _skillTree(BarbarianSkill.WarriorsSteelGrasp, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get pitFighter => _skillTree(
        BarbarianSkill.PitFighter,
        [
          _skillTree(
            BarbarianSkill.NoMercy,
            [
              _skillTree(BarbarianSkill.ExposeVulnerability, _childless),
            ],
          ),
          _skillTree(
            BarbarianSkill.SlayingStrike,
            [
              _skillTree(BarbarianSkill.ExposeVulnerability, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get thickSkin => _skillTree(
        BarbarianSkill.ThickSkin,
        [
          _skillTree(BarbarianSkill.DefensiveStance, _childless),
          _skillTree(BarbarianSkill.Counteroffensive, _childless),
        ],
      );

  static Tree<Enum> get hamstring => _skillTree(
        BarbarianSkill.Hamstring,
        [
          _skillTree(BarbarianSkill.CutToTheBone, _childless),
        ],
      );

  static Tree<Enum> get callOfTheAncients => _skillTree(
        BarbarianSkill.CallOfTheAncients,
        [
          _skillTree(
            BarbarianSkill.PrimeCallOfTheAncients,
            [
              _skillTree(BarbarianSkill.SupremeCallOfTheAncients, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get ironMaelstrom => _skillTree(
        BarbarianSkill.IronMaelstrom,
        [
          _skillTree(
            BarbarianSkill.PrimeIronMaelstrom,
            [
              _skillTree(BarbarianSkill.SupremeIronMaelstrom, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get wrathOfTheBerserker => _skillTree(
        BarbarianSkill.WrathOfTheBerserker,
        [
          _skillTree(
            BarbarianSkill.PrimeWrathOfTheBerserker,
            [
              _skillTree(BarbarianSkill.SupremeWrathOfTheBerserker, _childless),
            ],
          ),
        ],
      );

  static Tree<Enum> get heavyHanded => _skillTree(
        BarbarianSkill.HeavyHanded,
        [
          _skillTree(BarbarianSkill.BruteForce, _childless),
        ],
      );

  static Tree<Enum> get wallop => _skillTree(
        BarbarianSkill.Wallop,
        [
          _skillTree(BarbarianSkill.BruteForce, _childless),
          _skillTree(BarbarianSkill.Concussion, _childless),
        ],
      );

  static Tree<Enum> get temperedFury => _skillTree(
        BarbarianSkill.TemperedFury,
        [
          _skillTree(BarbarianSkill.FuriousImpulse, _childless),
          _skillTree(BarbarianSkill.InvigoratingFury, _childless),
        ],
      );

  static Tree<Enum> get duelist =>
      _skillTree(BarbarianSkill.Duelist, _childless);

  static Tree<Enum> get unconstrained =>
      _skillTree(BarbarianSkill.Unconstrained, _childless);

  static Tree<Enum> get walkingArsenal =>
      _skillTree(BarbarianSkill.WalkingArsenal, _childless);

  static Tree<Enum> get unbridledRage =>
      _skillTree(BarbarianSkill.UnbridledRage, _childless);

  static Tree<Enum> get gushingWounds =>
      _skillTree(BarbarianSkill.GushingWounds, _childless);

  static Tree<Enum> get basic => _skillTree(
        BarbarianCluster.Basic,
        [
          bash,
          flay,
          frenzy,
          lungingStrike,
        ],
      );

  static Tree<Enum> get core => _skillTree(
        BarbarianCluster.Core,
        [
          doubleSwing,
          hammerOfTheAncients,
          rend,
          upheaval,
          whirlwind,
        ],
      );

  static Tree<Enum> get defensive => _skillTree(
        BarbarianCluster.Defensive,
        [
          challengingShout,
          groundStomp,
          ironSkin,
          rallyingCry,
          imposingPresence,
          outburst,
        ],
      );

  static Tree<Enum> get brawling => _skillTree(
        BarbarianCluster.Brawling,
        [
          charge,
          kick,
          leap,
          warCry,
          boomingVoice,
          aggressiveResistance,
          swiftness,
        ],
      );

  static Tree<Enum> get weaponMastery => _skillTree(
        BarbarianCluster.WeaponMastery,
        [
          deathBlow,
          rupture,
          steelGrasp,
          pitFighter,
          thickSkin,
          hamstring,
        ],
      );

  static Tree<Enum> get ultimate => _skillTree(
        BarbarianCluster.Ultimate,
        [
          callOfTheAncients,
          ironMaelstrom,
          wrathOfTheBerserker,
          heavyHanded,
          wallop,
          temperedFury,
          duelist,
        ],
      );

  static Tree<Enum> get keyPassive => _skillTree(
        BarbarianCluster.KeyPassive,
        [
          unconstrained,
          walkingArsenal,
          unbridledRage,
          gushingWounds,
        ],
      );

  static Tree<Enum> get barbarian => _skillTree(
        Hero.Barbarian,
        [
          basic,
          core,
          defensive,
          brawling,
          weaponMastery,
          ultimate,
          keyPassive,
        ],
      );
}
