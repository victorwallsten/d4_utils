import 'package:d4_utils/src/data_structures/pair.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/sorcerer_cluster.dart';
import 'package:d4_utils/src/enums/sorcerer_skill.dart';
import 'package:d4_utils/src/enums/character_class.dart';

abstract class Sorcerer {
  static Tree<Pair<Enum, int>> _tree(
          Enum e, List<Tree<Pair<Enum, int>>> children) =>
      Tree(element: Pair(e, 0), children: children);

  static List<Tree<Pair<Enum, int>>> get _childless => const [];

  /* Basic */
  static Tree<Pair<Enum, int>> get spark => _tree(
        SorcererSkill.Spark,
        [
          _tree(
            SorcererSkill.EnhancedSpark,
            [
              _tree(SorcererSkill.FlickeringSpark, _childless),
              _tree(SorcererSkill.GlintingSpark, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get frostBolt => _tree(
        SorcererSkill.FrostBolt,
        [
          _tree(
            SorcererSkill.EnhancedFrostBolt,
            [
              _tree(SorcererSkill.FlickeringFrostBolt, _childless),
              _tree(SorcererSkill.GlintingFrostBolt, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get fireBolt => _tree(
        SorcererSkill.FireBolt,
        [
          _tree(
            SorcererSkill.EnhancedFireBolt,
            [
              _tree(SorcererSkill.FlickeringFireBolt, _childless),
              _tree(SorcererSkill.GlintingFireBolt, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get arcLash => _tree(
        SorcererSkill.ArcLash,
        [
          _tree(
            SorcererSkill.EnhancedArcLash,
            [
              _tree(SorcererSkill.FlickeringArcLash, _childless),
              _tree(SorcererSkill.GlintingArcLash, _childless),
            ],
          ),
        ],
      );

  /* Core */
  static Tree<Pair<Enum, int>> get chainLightning => _tree(
        SorcererSkill.ChainLightning,
        [
          _tree(
            SorcererSkill.EnhancedChainLightning,
            [
              _tree(SorcererSkill.DestructiveChainLightning, _childless),
              _tree(SorcererSkill.GreaterChainLightning, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get chargedBolts => _tree(
        SorcererSkill.ChargedBolts,
        [
          _tree(
            SorcererSkill.EnhancedChargedBolts,
            [
              _tree(SorcererSkill.DestructiveChargedBolts, _childless),
              _tree(SorcererSkill.GreaterChargedBolts, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get fireball => _tree(
        SorcererSkill.Fireball,
        [
          _tree(
            SorcererSkill.EnhancedFireball,
            [
              _tree(SorcererSkill.DestructiveFireball, _childless),
              _tree(SorcererSkill.GreaterFireball, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get frozenOrb => _tree(
        SorcererSkill.FrozenOrb,
        [
          _tree(
            SorcererSkill.EnhancedFrozenOrb,
            [
              _tree(SorcererSkill.DestructiveFrozenOrb, _childless),
              _tree(SorcererSkill.GreaterFrozenOrb, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get incinerate => _tree(
        SorcererSkill.Incinerate,
        [
          _tree(
            SorcererSkill.EnhancedIncinerate,
            [
              _tree(SorcererSkill.DestructiveIncinerate, _childless),
              _tree(SorcererSkill.GreaterIncinerate, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get iceShards => _tree(
        SorcererSkill.IceShards,
        [
          _tree(
            SorcererSkill.EnhancedIceShards,
            [
              _tree(SorcererSkill.DestructiveIceShards, _childless),
              _tree(SorcererSkill.GreaterIceShards, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get devastation => _tree(
        SorcererSkill.Devastation,
        [
          _tree(SorcererSkill.ElementalDominance, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get potentWarding =>
      _tree(SorcererSkill.PotentWarding, _childless);

  /* Defensive */
  static Tree<Pair<Enum, int>> get flameShield => _tree(
        SorcererSkill.FlameShield,
        [
          _tree(
            SorcererSkill.EnhancedFlameShield,
            [
              _tree(SorcererSkill.MysticalFlameShield, _childless),
              _tree(SorcererSkill.ShimmeringFlameShield, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get iceArmor => _tree(
        SorcererSkill.IceArmor,
        [
          _tree(
            SorcererSkill.EnhancedIceArmor,
            [
              _tree(SorcererSkill.MysticalIceArmor, _childless),
              _tree(SorcererSkill.ShimmeringIceArmor, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get teleport => _tree(
        SorcererSkill.Teleport,
        [
          _tree(
            SorcererSkill.EnhancedTeleport,
            [
              _tree(SorcererSkill.MysticalTeleport, _childless),
              _tree(SorcererSkill.ShimmeringTeleport, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get frostNova => _tree(
        SorcererSkill.FrostNova,
        [
          _tree(
            SorcererSkill.EnhancedFrostNova,
            [
              _tree(SorcererSkill.MysticalFrostNova, _childless),
              _tree(SorcererSkill.ShimmeringFrostNova, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get elementalAttunement =>
      _tree(SorcererSkill.ElementalAttunement, _childless);

  static Tree<Pair<Enum, int>> get glassCannon =>
      _tree(SorcererSkill.GlassCannon, _childless);

  /* Conjuration */
  static Tree<Pair<Enum, int>> get hydra => _tree(
        SorcererSkill.Hydra,
        [
          _tree(
            SorcererSkill.EnhancedHydra,
            [
              _tree(SorcererSkill.InvokedHydra, _childless),
              _tree(SorcererSkill.SummonedHydra, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get iceBlades => _tree(
        SorcererSkill.IceBlades,
        [
          _tree(
            SorcererSkill.EnhancedIceBlades,
            [
              _tree(SorcererSkill.InvokedIceBlades, _childless),
              _tree(SorcererSkill.SummonedIceBlades, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get lightningSpear => _tree(
        SorcererSkill.LightningSpear,
        [
          _tree(
            SorcererSkill.EnhancedLightningSpear,
            [
              _tree(SorcererSkill.InvokedLightningSpear, _childless),
              _tree(SorcererSkill.SummonedLightningSpear, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get alignTheElements => _tree(
        SorcererSkill.AlignTheElements,
        [
          _tree(SorcererSkill.ManaShield, _childless),
          _tree(SorcererSkill.Protection, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get precisionMagic =>
      _tree(SorcererSkill.PrecisionMagic, _childless);

  static Tree<Pair<Enum, int>> get conjurationMastery =>
      _tree(SorcererSkill.ConjurationMastery, _childless);

  /* Mastery */
  static Tree<Pair<Enum, int>> get blizzard => _tree(
        SorcererSkill.Blizzard,
        [
          _tree(
            SorcererSkill.EnhancedBlizzard,
            [
              _tree(SorcererSkill.MagesBlizzard, _childless),
              _tree(SorcererSkill.WizardsBlizzard, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get firewall => _tree(
        SorcererSkill.Firewall,
        [
          _tree(
            SorcererSkill.EnhancedFirewall,
            [
              _tree(SorcererSkill.MagesFirewall, _childless),
              _tree(SorcererSkill.WizardsFirewall, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get meteor => _tree(
        SorcererSkill.Meteor,
        [
          _tree(
            SorcererSkill.EnhancedMeteor,
            [
              _tree(SorcererSkill.MagesMeteor, _childless),
              _tree(SorcererSkill.WizardsMeteor, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get ballLightning => _tree(
        SorcererSkill.BallLightning,
        [
          _tree(
            SorcererSkill.EnhancedBallLightning,
            [
              _tree(SorcererSkill.MagesBallLightning, _childless),
              _tree(SorcererSkill.WizardsBallLightning, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get icyVeil => _tree(
        SorcererSkill.IcyVeil,
        [
          _tree(SorcererSkill.ColdFront, _childless),
          _tree(SorcererSkill.SnapFreeze, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get innerFlames => _tree(
        SorcererSkill.InnerFlames,
        [
          _tree(SorcererSkill.CripplingFlames, _childless),
          _tree(SorcererSkill.DevouringBlaze, _childless),
        ],
      );

  static Tree<Pair<Enum, int>> get staticDischarge => _tree(
        SorcererSkill.StaticDischarge,
        [
          _tree(SorcererSkill.ShockingImpact, _childless),
          _tree(SorcererSkill.InvigoratingConduit, _childless),
        ],
      );

  /* Ultimate */
  static Tree<Pair<Enum, int>> get deepFreeze => _tree(
        SorcererSkill.DeepFreeze,
        [
          _tree(
            SorcererSkill.PrimeDeepFreeze,
            [
              _tree(SorcererSkill.SupremeDeepFreeze, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get inferno => _tree(
        SorcererSkill.Inferno,
        [
          _tree(
            SorcererSkill.PrimeInferno,
            [
              _tree(SorcererSkill.SupremeInferno, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get unstableCurrents => _tree(
        SorcererSkill.UnstableCurrents,
        [
          _tree(
            SorcererSkill.PrimeUnstableCurrents,
            [
              _tree(SorcererSkill.SupremeUnstableCurrents, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get permafrost => _tree(
        SorcererSkill.Permafrost,
        [
          _tree(
            SorcererSkill.Hoarfrost,
            [
              // TODO: this one has two parents (see below)
              _tree(SorcererSkill.FrigidBreeze, _childless),
            ],
          ),
          _tree(
            SorcererSkill.IcyTouch,
            [
              // TODO: this one has two parents (see above)
              _tree(SorcererSkill.FrigidBreeze, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get fierySurge => _tree(
        SorcererSkill.FierySurge,
        [
          _tree(
            SorcererSkill.EndlessPyre,
            [
              // TODO: this one has two parents (see below)
              _tree(SorcererSkill.Warmth, _childless),
            ],
          ),
          _tree(
            SorcererSkill.Soulfire,
            [
              // TODO: this one has two parents (see above)
              _tree(SorcererSkill.Warmth, _childless),
            ],
          ),
        ],
      );

  static Tree<Pair<Enum, int>> get coursingCurrents => _tree(
        SorcererSkill.CoursingCurrents,
        [
          _tree(
            SorcererSkill.Conduction,
            [
              // TODO: this one has two parents (see below)
              _tree(SorcererSkill.Convulsions, _childless),
            ],
          ),
          _tree(
            SorcererSkill.Electrocution,
            [
              // TODO: this one has two parents (see above)
              _tree(SorcererSkill.Convulsions, _childless),
            ],
          ),
        ],
      );

  /* Key Passive */
  static Tree<Pair<Enum, int>> get avalanche =>
      _tree(SorcererSkill.Avalanche, _childless);

  static Tree<Pair<Enum, int>> get shatter =>
      _tree(SorcererSkill.Shatter, _childless);

  static Tree<Pair<Enum, int>> get overflowingEnergy =>
      _tree(SorcererSkill.OverflowingEnergy, _childless);

  static Tree<Pair<Enum, int>> get vyrsMastery =>
      _tree(SorcererSkill.VyrsMastery, _childless);

  static Tree<Pair<Enum, int>> get esusFerocity =>
      _tree(SorcererSkill.EsusFerocity, _childless);

  static Tree<Pair<Enum, int>> get combustion =>
      _tree(SorcererSkill.Combustion, _childless);
}
