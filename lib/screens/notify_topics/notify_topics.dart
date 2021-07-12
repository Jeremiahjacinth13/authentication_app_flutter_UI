import 'package:authapp/constants.dart';
import 'package:authapp/widgets/appbar_with_navigation.dart';
import 'package:authapp/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationAccept extends StatelessWidget {
  static String routeName = '/notification_accept';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(context, 1),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(kDefaultPadding),
          margin: EdgeInsets.only(top: 50.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/Workspace object 3notification_icon.png",
                ),
                SizedBox(height: 40.0),
                Text(
                  'Notifications is cool',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 30.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(height: 7.0),
                Container(
                  width: size.width * 0.8,
                  child: Text(
                    "You can get updates regarding following and also when people give reactions to your activity",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: kTextColor.withOpacity(0.8),
                        height: 1.5),
                  ),
                ),
                SizedBox(height: 40.0),
                CustomButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/notify_topics'),
                  text: 'Turn on notifications',
                ),
                SizedBox(height: 20.0),
                TextButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        Size(double.infinity, 60)),
                  ),
                  child: Text(
                    'Remind me later',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: kPrimaryColor, fontSize: 18.0),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NotifyTopics extends StatelessWidget {
  const NotifyTopics({Key? key}) : super(key: key);

  static String routeName = '/notify_topics';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(context, 1),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 15.0),
              Container(
                width: size.width * 0.8,
                child: Text(
                  'Choose topics that you find interesting',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: 30.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      height: 1.4),
                ),
              ),
              SizedBox(height: 40.0),
              NotificationArea(
                title: "Games",
                tags: ['New Release', 'Console', 'Tips'],
                iconSrc: 'assets/icons/Game.svg',
                tobeNotified: true,
              ),
              Divider(),
              NotificationArea(
                title: "Economy",
                tags: ['Stock', 'Property', 'News'],
                iconSrc: 'assets/icons/Graphgraph_icon.svg',
                tobeNotified: true,
              ),
              Divider(),
              NotificationArea(
                title: "Entertainment",
                tags: ["Movie", 'Music', 'Podcase'],
                iconSrc: 'assets/icons/Play.svg',
                tobeNotified: true,
              ),
              Divider(),
              NotificationArea(
                title: "Games",
                tags: ['New Release', 'Console', 'Tips'],
                iconSrc: 'assets/icons/Game.svg',
                tobeNotified: false,
              ),
              Divider(),
              NotificationArea(
                title: "Economy",
                tags: ['Stock', 'Property', 'News'],
                iconSrc: 'assets/icons/Graphgraph_icon.svg',
                tobeNotified: false,
              ),
              SizedBox(height: 60.0),
              CustomButton(text: "Turn on notifications", onPressed: () {}),
              TextButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                      Size(double.infinity, 60)),
                ),
                child: Text(
                  'Remind me later',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kPrimaryColor, fontSize: 18.0),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationArea extends StatefulWidget {
  const NotificationArea(
      {Key? key,
      required this.title,
      required this.iconSrc,
      required this.tags,
      this.tobeNotified = false})
      : super(key: key);

  final String title, iconSrc;
  final bool tobeNotified;
  final List<String> tags;

  @override
  _NotificationAreaState createState() => _NotificationAreaState();
}

class _NotificationAreaState extends State<NotificationArea> {
  late bool _tobeNotified = widget.tobeNotified;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              SvgPicture.asset(widget.iconSrc),
              SizedBox(
                width: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 20.0)),
                  SizedBox(height: 4.0),
                  Text(
                    widget.tags
                        .toString()
                        .replaceAll('[', '')
                        .replaceAll(']', ''),
                    style: TextStyle(color: Colors.black54, fontSize: 16.0),
                  ),
                ],
              ),
            ],
          ),
          CupertinoSwitch(
            activeColor: kPrimaryColor,
            value: _tobeNotified,
            onChanged: (bool tobeNotified) =>
                setState(() => _tobeNotified = !_tobeNotified),
          )
        ],
      ),
    );
  }
}
