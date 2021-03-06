import 'dart:math';

import 'package:flutter/material.dart';

class RatingView extends StatefulWidget {
  const RatingView({Key? key}) : super(key: key);

  @override
  _RatingViewState createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  var _ratingPageController = PageController();
  var _starPosition = 200.0;
  var _rating = 0;
  var _selectedChipIndex = -1;
  var _isMoreDetailActive = false;
  var _moreDetailFoucsNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          SizedBox(
            height: max(300, MediaQuery.of(context).size.height * 0.3),
            child: PageView(
              controller: _ratingPageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildThanksNote(),
                _causeOfRating(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.green,
              child: MaterialButton(
                onPressed: ()=>Navigator.pop(context),
                child: const Text("Done"),
                textColor: Colors.white,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: MaterialButton(
              onPressed: ()=>Navigator.pop(context),
              child: const Text("Skip"),
            ),
          ),
          AnimatedPositioned(
            top: _starPosition,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => IconButton(
                  icon: index < _rating
                      ? const Icon(Icons.star, size: 32)
                      : const Icon(
                          Icons.star_border,
                          size: 32,
                        ),
                  color: Colors.green,
                  onPressed: () {
                    _ratingPageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                    setState(() {
                      _starPosition = 20.0;
                      _rating = index + 1;
                    });
                  },
                ),
              ),
            ),
            duration: const Duration(milliseconds: 300),
          ),
          if (_isMoreDetailActive)
            Positioned(
              left: 0,
              top: 0,
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    _isMoreDetailActive = false;
                  });
                },
                child: const Icon(Icons.arrow_back_ios),
              ),
            ),
        ],
      ),
    );
  }

  _buildThanksNote() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Thanks for riding on Bus on Demand",
          style: TextStyle(
            fontSize: 24,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text("we\"d love to get your feedback"),
        Text("How was your ride today")
      ],
    );
  }

  _causeOfRating() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: !_isMoreDetailActive,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("What could be better?"),
              Wrap(
                spacing: 8.0,
                alignment: WrapAlignment.center,
                children: List.generate(
                  6,
                  (index) => InkWell(
                    onTap: () {
                      setState(() {
                        _selectedChipIndex = index;
                      });
                    },
                    child: Chip(
                      backgroundColor: _selectedChipIndex == index
                          ? Colors.green
                          : Colors.grey[300],
                      label: Text("Text ${index + 1}"),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  _moreDetailFoucsNode.requestFocus();
                  setState(() {
                    _isMoreDetailActive = true;
                  });
                },
                child: const Text(
                  "Want to tell us more?",
                  style: TextStyle(decoration: TextDecoration.overline),
                ),
              )
            ],
          ),
          replacement: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Tell us more"),
              Chip(
                label: Text("Text ${_selectedChipIndex + 1}"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  focusNode: _moreDetailFoucsNode,
                  decoration: InputDecoration(
                    helperText: "Wite you review here...",
                    helperStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _hideDialog() {
    if (Navigator.canPop(context)) Navigator.canPop(context);
  }
}
