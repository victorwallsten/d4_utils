import 'package:d4_utils/src/data_structures/skill.dart';
import 'package:d4_utils/src/data_structures/tree.dart';
import 'package:d4_utils/src/enums/skill_type.dart';
import 'package:d4_utils/src/enums/sorcerer_cluster.dart';
import 'package:d4_utils/src/enums/sorcerer_skill.dart';
import 'package:d4_utils/src/enums/character_class.dart';

abstract class Sorcerer {
  static Tree<Skill> _skillTree(Enum e, List<Tree<Skill>> children) =>
      Tree(element: Skill(e), children: children);

  static List<Tree<Skill>> get _childless => const [];

  static SkillType skillTypeOf(SorcererSkill sorcererSkill) {
    switch (sorcererSkill) {
      case SorcererSkill.Spark:
      case SorcererSkill.FrostBolt:
      case SorcererSkill.FireBolt:
      case SorcererSkill.ArcLash:
      case SorcererSkill.ChainLightning:
      case SorcererSkill.ChargedBolts:
      case SorcererSkill.Fireball:
      case SorcererSkill.FrozenOrb:
      case SorcererSkill.Incinerate:
      case SorcererSkill.IceShards:
      case SorcererSkill.FlameShield:
      case SorcererSkill.IceArmor:
      case SorcererSkill.Teleport:
      case SorcererSkill.FrostNova:
      case SorcererSkill.Hydra:
      case SorcererSkill.IceBlades:
      case SorcererSkill.LightningSpear:
      case SorcererSkill.Blizzard:
      case SorcererSkill.Firewall:
      case SorcererSkill.Meteor:
      case SorcererSkill.BallLightning:
      case SorcererSkill.DeepFreeze:
      case SorcererSkill.Inferno:
      case SorcererSkill.UnstableCurrents:
        return SkillType.Active;
      case SorcererSkill.EnhancedSpark:
      case SorcererSkill.EnhancedFrostBolt:
      case SorcererSkill.EnhancedFireBolt:
      case SorcererSkill.EnhancedArcLash:
      case SorcererSkill.EnhancedChainLightning:
      case SorcererSkill.EnhancedChargedBolts:
      case SorcererSkill.EnhancedFireball:
      case SorcererSkill.EnhancedFrozenOrb:
      case SorcererSkill.EnhancedIncinerate:
      case SorcererSkill.EnhancedIceShards:
      case SorcererSkill.EnhancedFlameShield:
      case SorcererSkill.EnhancedIceArmor:
      case SorcererSkill.EnhancedTeleport:
      case SorcererSkill.EnhancedFrostNova:
      case SorcererSkill.EnhancedHydra:
      case SorcererSkill.EnhancedIceBlades:
      case SorcererSkill.EnhancedLightningSpear:
      case SorcererSkill.EnhancedBlizzard:
      case SorcererSkill.EnhancedFirewall:
      case SorcererSkill.EnhancedMeteor:
      case SorcererSkill.EnhancedBallLightning:
      case SorcererSkill.PrimeDeepFreeze:
      case SorcererSkill.PrimeInferno:
      case SorcererSkill.PrimeUnstableCurrents:
        return SkillType.Enhancement;
      case SorcererSkill.FlickeringSpark:
      case SorcererSkill.GlintingSpark:
      case SorcererSkill.FlickeringFrostBolt:
      case SorcererSkill.GlintingFrostBolt:
      case SorcererSkill.FlickeringFireBolt:
      case SorcererSkill.GlintingFireBolt:
      case SorcererSkill.FlickeringArcLash:
      case SorcererSkill.GlintingArcLash:
      case SorcererSkill.DestructiveChainLightning:
      case SorcererSkill.GreaterChainLightning:
      case SorcererSkill.DestructiveChargedBolts:
      case SorcererSkill.GreaterChargedBolts:
      case SorcererSkill.DestructiveFireball:
      case SorcererSkill.GreaterFireball:
      case SorcererSkill.DestructiveFrozenOrb:
      case SorcererSkill.GreaterFrozenOrb:
      case SorcererSkill.DestructiveIncinerate:
      case SorcererSkill.GreaterIncinerate:
      case SorcererSkill.DestructiveIceShards:
      case SorcererSkill.GreaterIceShards:
      case SorcererSkill.MysticalFlameShield:
      case SorcererSkill.ShimmeringFlameShield:
      case SorcererSkill.MysticalIceArmor:
      case SorcererSkill.ShimmeringIceArmor:
      case SorcererSkill.MysticalTeleport:
      case SorcererSkill.ShimmeringTeleport:
      case SorcererSkill.MysticalFrostNova:
      case SorcererSkill.ShimmeringFrostNova:
      case SorcererSkill.InvokedHydra:
      case SorcererSkill.SummonedHydra:
      case SorcererSkill.InvokedIceBlades:
      case SorcererSkill.SummonedIceBlades:
      case SorcererSkill.InvokedLightningSpear:
      case SorcererSkill.SummonedLightningSpear:
      case SorcererSkill.MagesBlizzard:
      case SorcererSkill.WizardsBlizzard:
      case SorcererSkill.MagesFirewall:
      case SorcererSkill.WizardsFirewall:
      case SorcererSkill.MagesMeteor:
      case SorcererSkill.WizardsMeteor:
      case SorcererSkill.MagesBallLightning:
      case SorcererSkill.WizardsBallLightning:
      case SorcererSkill.SupremeDeepFreeze:
      case SorcererSkill.SupremeInferno:
      case SorcererSkill.SupremeUnstableCurrents:
        return SkillType.Upgrade;
      case SorcererSkill.Devastation:
      case SorcererSkill.ElementalDominance:
      case SorcererSkill.PotentWarding:
      case SorcererSkill.ElementalAttunement:
      case SorcererSkill.GlassCannon:
      case SorcererSkill.AlignTheElements:
      case SorcererSkill.ManaShield:
      case SorcererSkill.Protection:
      case SorcererSkill.PrecisionMagic:
      case SorcererSkill.ConjurationMastery:
      case SorcererSkill.IcyVeil:
      case SorcererSkill.ColdFront:
      case SorcererSkill.SnapFreeze:
      case SorcererSkill.InnerFlames:
      case SorcererSkill.CripplingFlames:
      case SorcererSkill.DevouringBlaze:
      case SorcererSkill.StaticDischarge:
      case SorcererSkill.ShockingImpact:
      case SorcererSkill.InvigoratingConduit:
      case SorcererSkill.Permafrost:
      case SorcererSkill.Hoarfrost:
      case SorcererSkill.IcyTouch:
      case SorcererSkill.FrigidBreeze:
      case SorcererSkill.FierySurge:
      case SorcererSkill.EndlessPyre:
      case SorcererSkill.Soulfire:
      case SorcererSkill.Warmth:
      case SorcererSkill.CoursingCurrents:
      case SorcererSkill.Conduction:
      case SorcererSkill.Electrocution:
      case SorcererSkill.Convulsions:
        return SkillType.Passive;
      case SorcererSkill.Avalanche:
      case SorcererSkill.Shatter:
      case SorcererSkill.OverflowingEnergy:
      case SorcererSkill.VyrsMastery:
      case SorcererSkill.EsusFerocity:
      case SorcererSkill.Combustion:
        return SkillType.KeyPassive;
    }
  }

  static Tree<Skill> get spark => _skillTree(
        SorcererSkill.Spark,
        [
          _skillTree(
            SorcererSkill.EnhancedSpark,
            [
              _skillTree(SorcererSkill.FlickeringSpark, _childless),
              _skillTree(SorcererSkill.GlintingSpark, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get frostBolt => _skillTree(
        SorcererSkill.FrostBolt,
        [
          _skillTree(
            SorcererSkill.EnhancedFrostBolt,
            [
              _skillTree(SorcererSkill.FlickeringFrostBolt, _childless),
              _skillTree(SorcererSkill.GlintingFrostBolt, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get fireBolt => _skillTree(
        SorcererSkill.FireBolt,
        [
          _skillTree(
            SorcererSkill.EnhancedFireBolt,
            [
              _skillTree(SorcererSkill.FlickeringFireBolt, _childless),
              _skillTree(SorcererSkill.GlintingFireBolt, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get arcLash => _skillTree(
        SorcererSkill.ArcLash,
        [
          _skillTree(
            SorcererSkill.EnhancedArcLash,
            [
              _skillTree(SorcererSkill.FlickeringArcLash, _childless),
              _skillTree(SorcererSkill.GlintingArcLash, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get chainLightning => _skillTree(
        SorcererSkill.ChainLightning,
        [
          _skillTree(
            SorcererSkill.EnhancedChainLightning,
            [
              _skillTree(SorcererSkill.DestructiveChainLightning, _childless),
              _skillTree(SorcererSkill.GreaterChainLightning, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get chargedBolts => _skillTree(
        SorcererSkill.ChargedBolts,
        [
          _skillTree(
            SorcererSkill.EnhancedChargedBolts,
            [
              _skillTree(SorcererSkill.DestructiveChargedBolts, _childless),
              _skillTree(SorcererSkill.GreaterChargedBolts, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get fireball => _skillTree(
        SorcererSkill.Fireball,
        [
          _skillTree(
            SorcererSkill.EnhancedFireball,
            [
              _skillTree(SorcererSkill.DestructiveFireball, _childless),
              _skillTree(SorcererSkill.GreaterFireball, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get frozenOrb => _skillTree(
        SorcererSkill.FrozenOrb,
        [
          _skillTree(
            SorcererSkill.EnhancedFrozenOrb,
            [
              _skillTree(SorcererSkill.DestructiveFrozenOrb, _childless),
              _skillTree(SorcererSkill.GreaterFrozenOrb, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get incinerate => _skillTree(
        SorcererSkill.Incinerate,
        [
          _skillTree(
            SorcererSkill.EnhancedIncinerate,
            [
              _skillTree(SorcererSkill.DestructiveIncinerate, _childless),
              _skillTree(SorcererSkill.GreaterIncinerate, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get iceShards => _skillTree(
        SorcererSkill.IceShards,
        [
          _skillTree(
            SorcererSkill.EnhancedIceShards,
            [
              _skillTree(SorcererSkill.DestructiveIceShards, _childless),
              _skillTree(SorcererSkill.GreaterIceShards, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get devastation => _skillTree(
        SorcererSkill.Devastation,
        [
          _skillTree(SorcererSkill.ElementalDominance, _childless),
        ],
      );

  static Tree<Skill> get potentWarding =>
      _skillTree(SorcererSkill.PotentWarding, _childless);

  static Tree<Skill> get flameShield => _skillTree(
        SorcererSkill.FlameShield,
        [
          _skillTree(
            SorcererSkill.EnhancedFlameShield,
            [
              _skillTree(SorcererSkill.MysticalFlameShield, _childless),
              _skillTree(SorcererSkill.ShimmeringFlameShield, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get iceArmor => _skillTree(
        SorcererSkill.IceArmor,
        [
          _skillTree(
            SorcererSkill.EnhancedIceArmor,
            [
              _skillTree(SorcererSkill.MysticalIceArmor, _childless),
              _skillTree(SorcererSkill.ShimmeringIceArmor, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get teleport => _skillTree(
        SorcererSkill.Teleport,
        [
          _skillTree(
            SorcererSkill.EnhancedTeleport,
            [
              _skillTree(SorcererSkill.MysticalTeleport, _childless),
              _skillTree(SorcererSkill.ShimmeringTeleport, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get frostNova => _skillTree(
        SorcererSkill.FrostNova,
        [
          _skillTree(
            SorcererSkill.EnhancedFrostNova,
            [
              _skillTree(SorcererSkill.MysticalFrostNova, _childless),
              _skillTree(SorcererSkill.ShimmeringFrostNova, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get elementalAttunement =>
      _skillTree(SorcererSkill.ElementalAttunement, _childless);

  static Tree<Skill> get glassCannon =>
      _skillTree(SorcererSkill.GlassCannon, _childless);

  static Tree<Skill> get hydra => _skillTree(
        SorcererSkill.Hydra,
        [
          _skillTree(
            SorcererSkill.EnhancedHydra,
            [
              _skillTree(SorcererSkill.InvokedHydra, _childless),
              _skillTree(SorcererSkill.SummonedHydra, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get iceBlades => _skillTree(
        SorcererSkill.IceBlades,
        [
          _skillTree(
            SorcererSkill.EnhancedIceBlades,
            [
              _skillTree(SorcererSkill.InvokedIceBlades, _childless),
              _skillTree(SorcererSkill.SummonedIceBlades, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get lightningSpear => _skillTree(
        SorcererSkill.LightningSpear,
        [
          _skillTree(
            SorcererSkill.EnhancedLightningSpear,
            [
              _skillTree(SorcererSkill.InvokedLightningSpear, _childless),
              _skillTree(SorcererSkill.SummonedLightningSpear, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get alignTheElements => _skillTree(
        SorcererSkill.AlignTheElements,
        [
          _skillTree(SorcererSkill.ManaShield, _childless),
          _skillTree(SorcererSkill.Protection, _childless),
        ],
      );

  static Tree<Skill> get precisionMagic =>
      _skillTree(SorcererSkill.PrecisionMagic, _childless);

  static Tree<Skill> get conjurationMastery =>
      _skillTree(SorcererSkill.ConjurationMastery, _childless);

  static Tree<Skill> get blizzard => _skillTree(
        SorcererSkill.Blizzard,
        [
          _skillTree(
            SorcererSkill.EnhancedBlizzard,
            [
              _skillTree(SorcererSkill.MagesBlizzard, _childless),
              _skillTree(SorcererSkill.WizardsBlizzard, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get firewall => _skillTree(
        SorcererSkill.Firewall,
        [
          _skillTree(
            SorcererSkill.EnhancedFirewall,
            [
              _skillTree(SorcererSkill.MagesFirewall, _childless),
              _skillTree(SorcererSkill.WizardsFirewall, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get meteor => _skillTree(
        SorcererSkill.Meteor,
        [
          _skillTree(
            SorcererSkill.EnhancedMeteor,
            [
              _skillTree(SorcererSkill.MagesMeteor, _childless),
              _skillTree(SorcererSkill.WizardsMeteor, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get ballLightning => _skillTree(
        SorcererSkill.BallLightning,
        [
          _skillTree(
            SorcererSkill.EnhancedBallLightning,
            [
              _skillTree(SorcererSkill.MagesBallLightning, _childless),
              _skillTree(SorcererSkill.WizardsBallLightning, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get icyVeil => _skillTree(
        SorcererSkill.IcyVeil,
        [
          _skillTree(SorcererSkill.ColdFront, _childless),
          _skillTree(SorcererSkill.SnapFreeze, _childless),
        ],
      );

  static Tree<Skill> get innerFlames => _skillTree(
        SorcererSkill.InnerFlames,
        [
          _skillTree(SorcererSkill.CripplingFlames, _childless),
          _skillTree(SorcererSkill.DevouringBlaze, _childless),
        ],
      );

  static Tree<Skill> get staticDischarge => _skillTree(
        SorcererSkill.StaticDischarge,
        [
          _skillTree(SorcererSkill.ShockingImpact, _childless),
          _skillTree(SorcererSkill.InvigoratingConduit, _childless),
        ],
      );

  static Tree<Skill> get deepFreeze => _skillTree(
        SorcererSkill.DeepFreeze,
        [
          _skillTree(
            SorcererSkill.PrimeDeepFreeze,
            [
              _skillTree(SorcererSkill.SupremeDeepFreeze, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get inferno => _skillTree(
        SorcererSkill.Inferno,
        [
          _skillTree(
            SorcererSkill.PrimeInferno,
            [
              _skillTree(SorcererSkill.SupremeInferno, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get unstableCurrents => _skillTree(
        SorcererSkill.UnstableCurrents,
        [
          _skillTree(
            SorcererSkill.PrimeUnstableCurrents,
            [
              _skillTree(SorcererSkill.SupremeUnstableCurrents, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get permafrost => _skillTree(
        SorcererSkill.Permafrost,
        [
          _skillTree(
            SorcererSkill.Hoarfrost,
            [
              // TODO: this one has two parents (see below)
              _skillTree(SorcererSkill.FrigidBreeze, _childless),
            ],
          ),
          _skillTree(
            SorcererSkill.IcyTouch,
            [
              // TODO: this one has two parents (see above)
              _skillTree(SorcererSkill.FrigidBreeze, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get fierySurge => _skillTree(
        SorcererSkill.FierySurge,
        [
          _skillTree(
            SorcererSkill.EndlessPyre,
            [
              // TODO: this one has two parents (see below)
              _skillTree(SorcererSkill.Warmth, _childless),
            ],
          ),
          _skillTree(
            SorcererSkill.Soulfire,
            [
              // TODO: this one has two parents (see above)
              _skillTree(SorcererSkill.Warmth, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get coursingCurrents => _skillTree(
        SorcererSkill.CoursingCurrents,
        [
          _skillTree(
            SorcererSkill.Conduction,
            [
              // TODO: this one has two parents (see below)
              _skillTree(SorcererSkill.Convulsions, _childless),
            ],
          ),
          _skillTree(
            SorcererSkill.Electrocution,
            [
              // TODO: this one has two parents (see above)
              _skillTree(SorcererSkill.Convulsions, _childless),
            ],
          ),
        ],
      );

  static Tree<Skill> get avalanche =>
      _skillTree(SorcererSkill.Avalanche, _childless);

  static Tree<Skill> get shatter =>
      _skillTree(SorcererSkill.Shatter, _childless);

  static Tree<Skill> get overflowingEnergy =>
      _skillTree(SorcererSkill.OverflowingEnergy, _childless);

  static Tree<Skill> get vyrsMastery =>
      _skillTree(SorcererSkill.VyrsMastery, _childless);

  static Tree<Skill> get esusFerocity =>
      _skillTree(SorcererSkill.EsusFerocity, _childless);

  static Tree<Skill> get combustion =>
      _skillTree(SorcererSkill.Combustion, _childless);

  static Tree<Skill> get basic => _skillTree(
        SorcererCluster.Basic,
        [
          spark,
          frostBolt,
          fireBolt,
          arcLash,
        ],
      );

  static Tree<Skill> get core => _skillTree(
        SorcererCluster.Core,
        [
          chainLightning,
          chargedBolts,
          fireball,
          frozenOrb,
          incinerate,
          iceShards,
          devastation,
          potentWarding,
        ],
      );

  static Tree<Skill> get defensive => _skillTree(
        SorcererCluster.Defensive,
        [
          flameShield,
          iceArmor,
          teleport,
          frostNova,
          elementalAttunement,
          glassCannon,
        ],
      );

  static Tree<Skill> get conjuration => _skillTree(
        SorcererCluster.Conjuration,
        [
          hydra,
          iceBlades,
          lightningSpear,
          alignTheElements,
          precisionMagic,
          conjurationMastery,
        ],
      );

  static Tree<Skill> get mastery => _skillTree(
        SorcererCluster.Mastery,
        [
          blizzard,
          firewall,
          meteor,
          ballLightning,
          icyVeil,
          innerFlames,
          staticDischarge,
        ],
      );

  static Tree<Skill> get ultimate => _skillTree(
        SorcererCluster.Ultimate,
        [
          deepFreeze,
          inferno,
          unstableCurrents,
          permafrost,
          fierySurge,
          coursingCurrents,
        ],
      );

  static Tree<Skill> get keyPassive => _skillTree(
        SorcererCluster.KeyPassive,
        [
          avalanche,
          shatter,
          overflowingEnergy,
          vyrsMastery,
          esusFerocity,
          combustion,
        ],
      );

  static Tree<Skill> get sorcerer => _skillTree(
        CharacterClass.Sorcerer,
        [
          basic,
          core,
          defensive,
          conjuration,
          mastery,
          ultimate,
          keyPassive,
        ],
      );
}
