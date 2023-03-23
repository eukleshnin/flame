import 'package:dashbook/dashbook.dart';
import 'package:examples/commons/commons.dart';
import 'package:examples/stories/bridge_libraries/forge2d/animated_body_example.dart';
import 'package:examples/stories/bridge_libraries/forge2d/blob_example.dart';
import 'package:examples/stories/bridge_libraries/forge2d/camera_example.dart';
import 'package:examples/stories/bridge_libraries/forge2d/composition_example.dart';
import 'package:examples/stories/bridge_libraries/forge2d/contact_callbacks_example.dart';
import 'package:examples/stories/bridge_libraries/forge2d/domino_example.dart';
import 'package:examples/stories/bridge_libraries/forge2d/draggable_example.dart';
import 'package:examples/stories/bridge_libraries/forge2d/joint_example.dart';
import 'package:examples/stories/bridge_libraries/forge2d/joints/constant_volume_joint.dart';
import 'package:examples/stories/bridge_libraries/forge2d/joints/distance_joint.dart';
import 'package:examples/stories/bridge_libraries/forge2d/joints/friction_joint.dart';
import 'package:examples/stories/bridge_libraries/forge2d/joints/motor_joint.dart';
import 'package:examples/stories/bridge_libraries/forge2d/joints/mouse_joint.dart';
import 'package:examples/stories/bridge_libraries/forge2d/joints/pulley_joint.dart';
import 'package:examples/stories/bridge_libraries/forge2d/raycast_example.dart';
import 'package:examples/stories/bridge_libraries/forge2d/revolute_joint_example.dart';
import 'package:examples/stories/bridge_libraries/forge2d/sprite_body_example.dart';
import 'package:examples/stories/bridge_libraries/forge2d/tappable_example.dart';
import 'package:examples/stories/bridge_libraries/forge2d/widget_example.dart';
import 'package:flame/game.dart';

String link(String example) => baseLink('bridge_libraries/forge2d/$example');

void addForge2DStories(Dashbook dashbook) {
  dashbook.storiesOf('flame_forge2d')
    ..add(
      'Blob example',
      (DashbookContext ctx) => GameWidget(game: BlobExample()),
      codeLink: link('blob_example.dart'),
      info: BlobExample.description,
    )
    ..add(
      'Composition example',
      (DashbookContext ctx) => GameWidget(game: CompositionExample()),
      codeLink: link('composition_example.dart'),
      info: CompositionExample.description,
    )
    ..add(
      'Domino example',
      (DashbookContext ctx) => GameWidget(game: DominoExample()),
      codeLink: link('domino_example.dart'),
      info: DominoExample.description,
    )
    ..add(
      'Contact Callbacks',
      (DashbookContext ctx) => GameWidget(game: ContactCallbacksExample()),
      codeLink: link('contact_callbacks_example.dart'),
      info: ContactCallbacksExample.description,
    )
    ..add(
      'RevoluteJoint',
      (DashbookContext ctx) => GameWidget(game: RevoluteJointExample()),
      codeLink: link('revolute_joint_example.dart'),
      info: RevoluteJointExample.description,
    )
    ..add(
      'Sprite Bodies',
      (DashbookContext ctx) => GameWidget(game: SpriteBodyExample()),
      codeLink: link('sprite_body_example.dart'),
      info: SpriteBodyExample.description,
    )
    ..add(
      'Animated Bodies',
      (DashbookContext ctx) => GameWidget(game: AnimatedBodyExample()),
      codeLink: link('animated_body_example.dart'),
      info: AnimatedBodyExample.description,
    )
    ..add(
      'Tappable Body',
      (DashbookContext ctx) => GameWidget(game: TappableExample()),
      codeLink: link('tappable_example.dart'),
      info: TappableExample.description,
    )
    ..add(
      'Draggable Body',
      (DashbookContext ctx) => GameWidget(game: DraggableExample()),
      codeLink: link('draggable_example.dart'),
      info: DraggableExample.description,
    )
    ..add(
      'Basic joint',
      (DashbookContext ctx) => GameWidget(game: JointExample()),
      codeLink: link('joint_example.dart'),
      info: JointExample.description,
    )
    ..add(
      'Camera',
      (DashbookContext ctx) => GameWidget(game: CameraExample()),
      codeLink: link('camera_example.dart'),
      info: CameraExample.description,
    )
    ..add(
      'Raycasting',
      (DashbookContext ctx) => GameWidget(game: RaycastExample()),
      codeLink: link('raycast_example.dart'),
      info: RaycastExample.description,
    )
    ..add(
      'Widgets',
      (DashbookContext ctx) => const BodyWidgetExample(),
      codeLink: link('widget_example.dart'),
      info: WidgetExample.description,
    );
  addJointsStories(dashbook);
}

void addJointsStories(Dashbook dashbook) {
  dashbook
      .storiesOf('flame_forge2d/joints')
      .add(
        'ConstantVolumeJoint',
        (DashbookContext ctx) => GameWidget(game: ConstantVolumeJointExample()),
        codeLink: link('constant_volume_joint.dart'),
        info: ConstantVolumeJointExample.description,
      )
      .add(
        'DistanceJoint',
        (DashbookContext ctx) => GameWidget(game: DistanceJointExample()),
        codeLink: link('distance_joint.dart'),
        info: DistanceJointExample.description,
      )
      .add(
        'FrictionJoint',
        (DashbookContext ctx) => GameWidget(game: FrictionJointExample()),
        codeLink: link('friction_joint.dart'),
        info: FrictionJointExample.description,
      )
      .add(
        'MotorJoint',
        (DashbookContext ctx) => GameWidget(game: MotorJointExample()),
        codeLink: link('motor_joint.dart'),
        info: MotorJointExample.description,
      )
      .add(
        'MouseJoint',
        (DashbookContext ctx) => GameWidget(game: MouseJointExample()),
        codeLink: link('mouse_joint.dart'),
        info: MouseJointExample.description,
      )
      .add(
        'PulleyJoint',
        (DashbookContext ctx) => GameWidget(game: PulleyJointExample()),
        codeLink: link('pulley_joint.dart'),
        info: PulleyJointExample.description,
      );
}
